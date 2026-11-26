#!/usr/bin/env python3
"""
Sync applied Cisco ACI Multi-Site, Nexus Dashboard Orchestrator and ISN
Ansible playbooks to NetBox 4.x via pynetbox.

Reads NETBOX_URL and NETBOX_TOKEN from environment variables (injected via
GitHub Secrets in CI). Designed to be copied into an automation repository
alongside aci-multisite-pipeline.yml and inventory.yml.

Documented NetBox 4.x custom fields (optional; create on tenancy/ipam models):
  - aci_tenant (text)
  - aci_vrf (text)
  - aci_bd (text)
  - aci_site (text)
  - aci_schema (text)
  - aci_template (text)
  - aci_l3out (text)
  - isn_vrf (text)
"""

from __future__ import annotations

import argparse
import ipaddress
import json
import os
import re
import sys
from pathlib import Path
from typing import Any

import yaml


def slugify(value: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return slug or "aci-object"


def parse_encap_vlan(raw: Any) -> int | None:
    if raw is None:
        return None
    text = str(raw).strip().lower()
    if text.startswith("vlan-"):
        text = text[5:]
    if text.isdigit():
        vid = int(text)
        if 1 <= vid <= 4094:
            return vid
    return None


def add_prefix(
    records: dict[str, list[dict[str, Any]]],
    seen_prefixes: set[str],
    cidr: str,
    description: str,
    tenant: str | None = None,
    custom_fields: dict[str, Any] | None = None,
) -> None:
    if not cidr or "{{" in cidr:
        return
    try:
        net = str(ipaddress.ip_network(cidr, strict=False))
    except ValueError:
        return
    if net in seen_prefixes:
        return
    seen_prefixes.add(net)
    rec: dict[str, Any] = {"prefix": net, "description": description}
    if tenant:
        rec["tenant"] = tenant
    if custom_fields:
        rec["custom_fields"] = custom_fields
    records["prefixes"].append(rec)


def extract_netbox_records(playbook_path: Path) -> dict[str, list[dict[str, Any]]]:
    docs = yaml.safe_load(playbook_path.read_text(encoding="utf-8"))
    if not isinstance(docs, list):
        raise ValueError(f"Expected list of plays in {playbook_path}")

    records: dict[str, list[dict[str, Any]]] = {
        "tenants": [],
        "vrfs": [],
        "prefixes": [],
        "vlans": [],
        "ip_addresses": [],
    }
    seen_tenants: set[str] = set()
    seen_vrfs: set[tuple[str, str]] = set()
    seen_prefixes: set[str] = set()
    seen_vlans: set[tuple[int, str]] = set()
    seen_ips: set[str] = set()

    def remember_tenant(tenant_name: str, description: str | None = None) -> None:
        name = str(tenant_name or "").strip()
        if not name or "{{" in name or name in seen_tenants:
            return
        seen_tenants.add(name)
        records["tenants"].append({
            "name": name,
            "slug": slugify(name),
            "description": description or f"Cisco ACI Multi-Site tenant {name}",
        })

    def remember_vrf(tenant_name: str, vrf_name: str, custom: dict[str, Any] | None = None) -> None:
        if not vrf_name or "{{" in vrf_name:
            return
        key = (tenant_name or "common", vrf_name)
        if key in seen_vrfs:
            return
        seen_vrfs.add(key)
        rec: dict[str, Any] = {
            "name": f"{key[0]}:{vrf_name}",
            "tenant": key[0],
            "enforce_unique": True,
            "custom_fields": custom or {"aci_tenant": key[0], "aci_vrf": vrf_name},
        }
        records["vrfs"].append(rec)

    for play in docs:
        if not isinstance(play, dict):
            continue
        for task in play.get("tasks", []) or []:
            if not isinstance(task, dict):
                continue
            for mod_name, params in task.items():
                if not isinstance(params, dict):
                    continue
                mod = str(mod_name)
                if not (
                    mod.startswith("cisco.aci.")
                    or mod.startswith("cisco.nxos.")
                    or mod.startswith("cisco.mso.")
                    or mod.startswith("cisco.nd.")
                ):
                    continue
                if params.get("state") in {"absent", "query"}:
                    continue

                tenant_name = str(params.get("tenant") or "").strip()
                if tenant_name:
                    remember_tenant(tenant_name)

                if mod == "cisco.mso.mso_tenant":
                    remember_tenant(str(params.get("tenant") or params.get("display_name") or "").strip())

                if mod in {"cisco.mso.mso_schema_template_vrf", "cisco.aci.aci_vrf"}:
                    vrf_name = str(params.get("vrf") or "").strip()
                    remember_vrf(tenant_name or "common", vrf_name)

                if mod == "cisco.mso.mso_schema_template_bd":
                    bd = str(params.get("bd") or "").strip()
                    vrf_name = str(params.get("vrf") or "").strip()
                    if vrf_name:
                        remember_vrf(tenant_name or "common", vrf_name, {
                            "aci_tenant": tenant_name or "common",
                            "aci_vrf": vrf_name,
                            "aci_bd": bd,
                        })
                    for subnet in params.get("subnets") or []:
                        if isinstance(subnet, dict):
                            add_prefix(
                                records,
                                seen_prefixes,
                                str(subnet.get("ip") or subnet.get("subnet") or ""),
                                f"ACI Multi-Site BD {bd} subnet",
                                tenant_name or None,
                                {"aci_tenant": tenant_name, "aci_bd": bd},
                            )

                if mod == "cisco.nxos.nxos_vrf":
                    for item in params.get("config", []) or []:
                        if isinstance(item, dict) and item.get("name"):
                            vname = str(item["name"]).strip()
                            key = ("isn", vname)
                            if key not in seen_vrfs:
                                seen_vrfs.add(key)
                                records["vrfs"].append({
                                    "name": f"isn:{vname}",
                                    "enforce_unique": True,
                                    "description": "Nexus ISN VRF",
                                    "custom_fields": {"isn_vrf": vname},
                                })

                if mod == "cisco.nxos.nxos_l3_interfaces":
                    for item in params.get("config", []) or []:
                        if not isinstance(item, dict):
                            continue
                        ifname = str(item.get("name") or "")
                        for ip_entry in item.get("ipv4", []) or []:
                            addr = str((ip_entry or {}).get("address") or "").strip()
                            if addr and "/" in addr and "{{" not in addr:
                                if addr not in seen_ips:
                                    seen_ips.add(addr)
                                    records["ip_addresses"].append({
                                        "address": addr,
                                        "description": f"ISN {ifname}",
                                    })
                                add_prefix(
                                    records,
                                    seen_prefixes,
                                    addr,
                                    f"ISN link/loopback ({ifname})",
                                )

                raw_str = json.dumps(params)
                for cidr in re.findall(r"\b(?:\d{1,3}\.){3}\d{1,3}/\d{1,2}\b", raw_str):
                    add_prefix(
                        records,
                        seen_prefixes,
                        cidr,
                        f"Prefix collected from {mod}",
                        tenant_name or None,
                    )

                vid = parse_encap_vlan(params.get("encap") or params.get("vlan"))
                if vid is not None:
                    name = f"isn-vlan-{vid}"
                    if (vid, name) not in seen_vlans:
                        seen_vlans.add((vid, name))
                        records["vlans"].append({"vid": vid, "name": name})

    return records


def sync_to_netbox(records: dict[str, list[dict[str, Any]]], dry_run: bool = False) -> None:
    if dry_run:
        print(json.dumps({"dry_run": True, "records": records}, indent=2))
        return

    url = os.environ.get("NETBOX_URL", "").strip()
    token = os.environ.get("NETBOX_TOKEN", "").strip()
    if not url or not token:
        raise SystemExit("NETBOX_URL and NETBOX_TOKEN must be set when not using --dry-run")

    import pynetbox  # imported only when live sync runs

    nb = pynetbox.api(url, token=token)
    tenant_ids: dict[str, int] = {}

    for t in records["tenants"]:
        existing = nb.tenancy.tenants.get(slug=t["slug"])
        if existing:
            tenant_ids[t["name"]] = existing.id
        else:
            created = nb.tenancy.tenants.create(t)
            tenant_ids[t["name"]] = created.id

    for v in records["vrfs"]:
        existing = nb.ipam.vrfs.get(name=v["name"])
        if not existing:
            payload = dict(v)
            tn = payload.pop("tenant", None)
            if tn and tn in tenant_ids:
                payload["tenant"] = tenant_ids[tn]
            else:
                payload.pop("tenant", None)
            nb.ipam.vrfs.create(payload)

    for p in records["prefixes"]:
        existing = nb.ipam.prefixes.get(prefix=p["prefix"])
        if not existing:
            payload = dict(p)
            tn = payload.pop("tenant", None)
            if tn and tn in tenant_ids:
                payload["tenant"] = tenant_ids[tn]
            else:
                payload.pop("tenant", None)
            nb.ipam.prefixes.create(payload)

    for ip in records["ip_addresses"]:
        existing = nb.ipam.ip_addresses.get(address=ip["address"])
        if not existing:
            nb.ipam.ip_addresses.create(ip)

    for vl in records["vlans"]:
        existing = nb.ipam.vlans.get(vid=vl["vid"], name=vl["name"])
        if not existing:
            payload = dict(vl)
            tn = payload.pop("tenant", None)
            if tn and tn in tenant_ids:
                payload["tenant"] = tenant_ids[tn]
            else:
                payload.pop("tenant", None)
            nb.ipam.vlans.create(payload)


def main() -> int:
    parser = argparse.ArgumentParser(description="Sync ACI Multi-Site, NDO and ISN playbooks to NetBox 4.x")
    parser.add_argument("--playbook", required=True, type=Path, help="Path to Ansible playbook YAML")
    parser.add_argument("--dry-run", action="store_true", help="Print extracted NetBox payloads without calling NetBox")
    args = parser.parse_args()

    records = extract_netbox_records(args.playbook)
    sync_to_netbox(records, dry_run=args.dry_run)
    return 0


if __name__ == "__main__":
    sys.exit(main())
