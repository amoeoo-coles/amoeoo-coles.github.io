#!/usr/bin/env python3
"""
Sync applied Cisco ACI Multi-Pod & Nexus IPN Ansible playbooks to NetBox 4.x via pynetbox.

Reads NETBOX_URL and NETBOX_TOKEN from environment variables (injected via
GitHub Secrets in CI). Designed to be copied into an automation repository
alongside aci-multipod-pipeline.yml and inventory.yml.

Documented NetBox 4.x custom fields (optional; create on tenancy/ipam models):
  - aci_tenant (text)
  - aci_vrf (text)
  - aci_bd (text)
  - aci_pod (text)
  - aci_tep_pool (text)
  - aci_l3out (text)
  - ipn_vrf (text)
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
                if not (mod.startswith("cisco.aci.") or mod.startswith("cisco.nxos.")):
                    continue
                if params.get("state") == "absent":
                    continue

                tenant_name = str(params.get("tenant") or "").strip()
                if tenant_name and "{{" not in tenant_name and tenant_name not in seen_tenants:
                    seen_tenants.add(tenant_name)
                    records["tenants"].append({
                        "name": tenant_name,
                        "slug": slugify(tenant_name),
                        "description": f"Cisco ACI tenant {tenant_name}",
                    })

                if mod == "cisco.aci.aci_vrf":
                    vrf_name = str(params.get("vrf") or "").strip()
                    if vrf_name and "{{" not in vrf_name:
                        key = (tenant_name or "common", vrf_name)
                        if key not in seen_vrfs:
                            seen_vrfs.add(key)
                            records["vrfs"].append({
                                "name": f"{key[0]}:{vrf_name}",
                                "tenant": key[0],
                                "enforce_unique": True,
                                "custom_fields": {"aci_tenant": key[0], "aci_vrf": vrf_name},
                            })

                if mod == "cisco.nxos.nxos_vrf":
                    for item in params.get("config", []) or []:
                        if isinstance(item, dict) and item.get("name"):
                            vname = str(item["name"]).strip()
                            key = ("ipn", vname)
                            if key not in seen_vrfs:
                                seen_vrfs.add(key)
                                records["vrfs"].append({
                                    "name": f"ipn:{vname}",
                                    "enforce_unique": True,
                                    "description": "Nexus IPN VRF",
                                    "custom_fields": {"ipn_vrf": vname},
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
                                        "description": f"IPN {ifname}",
                                    })
                                net = str(ipaddress.ip_network(addr, strict=False))
                                if net not in seen_prefixes:
                                    seen_prefixes.add(net)
                                    records["prefixes"].append({
                                        "prefix": net,
                                        "description": f"IPN link/loopback ({ifname})",
                                    })

                if mod == "cisco.aci.aci_l3out_interface":
                    addr = str(params.get("addr") or "").strip()
                    if addr and "/" in addr and "{{" not in addr:
                        if addr not in seen_ips:
                            seen_ips.add(addr)
                            records["ip_addresses"].append({
                                "address": addr,
                                "description": f"ACI L3Out {params.get('l3out', '')} node {params.get('node_id', '')}".strip(),
                            })
                        net = str(ipaddress.ip_network(addr, strict=False))
                        if net not in seen_prefixes:
                            seen_prefixes.add(net)
                            records["prefixes"].append({
                                "prefix": net,
                                "tenant": tenant_name or None,
                                "description": f"ACI Multi-Pod L3Out {params.get('l3out', '')}".strip(),
                                "custom_fields": {"aci_tenant": tenant_name, "aci_l3out": str(params.get("l3out") or "")},
                            })
                    vid = parse_encap_vlan(params.get("encap"))
                    if vid is not None:
                        l3o = str(params.get("l3out") or "multipod")
                        if (vid, l3o) not in seen_vlans:
                            seen_vlans.add((vid, l3o))
                            records["vlans"].append({
                                "vid": vid,
                                "name": f"{l3o}-vlan-{vid}",
                                "tenant": tenant_name or None,
                            })

                if mod == "cisco.aci.aci_rest":
                    content = params.get("content")
                    raw_str = json.dumps(content) if isinstance(content, (dict, list)) else str(content or "")
                    for cidr in re.findall(r"\b(?:\d{1,3}\.){3}\d{1,3}/\d{1,2}\b", raw_str):
                        try:
                            net = str(ipaddress.ip_network(cidr, strict=False))
                        except ValueError:
                            continue
                        if net not in seen_prefixes:
                            seen_prefixes.add(net)
                            records["prefixes"].append({
                                "prefix": net,
                                "tenant": tenant_name or None,
                                "description": f"ACI Multi-Pod TEP / Routable prefix ({params.get('path', '')})",
                                "custom_fields": {"aci_tenant": tenant_name or "infra"},
                            })

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
    parser = argparse.ArgumentParser(description="Sync ACI Multi-Pod & IPN playbooks to NetBox 4.x")
    parser.add_argument("--playbook", required=True, type=Path, help="Path to Ansible playbook YAML")
    parser.add_argument("--dry-run", action="store_true", help="Print extracted NetBox payloads without calling NetBox")
    args = parser.parse_args()

    records = extract_netbox_records(args.playbook)
    sync_to_netbox(records, dry_run=args.dry_run)
    return 0


if __name__ == "__main__":
    sys.exit(main())
