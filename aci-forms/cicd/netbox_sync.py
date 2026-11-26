#!/usr/bin/env python3
"""
Sync applied Cisco ACI Ansible playbook objects to NetBox 4.x via pynetbox.

Reads NETBOX_URL and NETBOX_TOKEN from environment variables (injected via
GitHub Secrets in CI). Designed to be copied into an automation repository
alongside aci-pipeline.yml and inventory.yml.

Documented NetBox 4.x custom fields (optional; create on tenancy/ipam models):
  - aci_tenant (text)
  - aci_vrf (text)
  - aci_bd (text)
  - aci_epg (text)
  - aci_contract (text)
  - aci_l3out (text)
  - aci_service_graph (text)
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
        "custom_field_notes": [],
    }
    seen_tenants: set[str] = set()
    seen_vrfs: set[tuple[str, str]] = set()
    seen_prefixes: set[str] = set()
    seen_vlans: set[tuple[int, str]] = set()

    for play in docs:
        if not isinstance(play, dict):
            continue
        for task in play.get("tasks", []) or []:
            if not isinstance(task, dict):
                continue
            for mod_name, params in task.items():
                if not isinstance(params, dict) or not str(mod_name).startswith("cisco.aci."):
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

                if mod_name == "cisco.aci.aci_vrf":
                    vrf_name = str(params.get("vrf") or "").strip()
                    if vrf_name and "{{" not in vrf_name:
                        key = (tenant_name or "common", vrf_name)
                        if key not in seen_vrfs:
                            seen_vrfs.add(key)
                            records["vrfs"].append({
                                "name": f"{key[0]}:{vrf_name}",
                                "tenant": key[0],
                                "enforce_unique": True,
                                "custom_fields": {
                                    "aci_tenant": key[0],
                                    "aci_vrf": vrf_name,
                                },
                            })

                if mod_name == "cisco.aci.aci_bd_subnet":
                    gw = str(params.get("gateway") or "").strip()
                    mask = str(params.get("mask") or "").strip()
                    if gw and mask and "{{" not in gw and "{{" not in mask:
                        net = ipaddress.ip_network(f"{gw}/{mask}", strict=False)
                        prefix_str = str(net)
                        if prefix_str not in seen_prefixes:
                            seen_prefixes.add(prefix_str)
                            records["prefixes"].append({
                                "prefix": prefix_str,
                                "tenant": tenant_name or None,
                                "description": f"ACI BD {params.get('bd', '')} subnet ({params.get('subnet_name', '')})".strip(),
                                "custom_fields": {
                                    "aci_tenant": tenant_name,
                                    "aci_bd": str(params.get("bd") or ""),
                                },
                            })

                if mod_name == "cisco.aci.aci_l3out_extsubnet":
                    network = str(params.get("network") or "").strip()
                    if network and "{{" not in network and network not in seen_prefixes:
                        seen_prefixes.add(network)
                        records["prefixes"].append({
                            "prefix": network,
                            "tenant": tenant_name or None,
                            "description": f"ACI L3Out {params.get('l3out', '')} ExtEPG {params.get('extepg', '')}".strip(),
                            "custom_fields": {
                                "aci_tenant": tenant_name,
                                "aci_l3out": str(params.get("l3out") or ""),
                                "aci_epg": str(params.get("extepg") or ""),
                            },
                        })

                if mod_name == "cisco.aci.aci_l3out_interface":
                    addr = str(params.get("addr") or "").strip()
                    if addr and "/" in addr and "{{" not in addr:
                        net = str(ipaddress.ip_network(addr, strict=False))
                        if net not in seen_prefixes:
                            seen_prefixes.add(net)
                            records["prefixes"].append({
                                "prefix": net,
                                "tenant": tenant_name or None,
                                "description": f"ACI L3Out {params.get('l3out', '')} routed interface",
                                "custom_fields": {
                                    "aci_tenant": tenant_name,
                                    "aci_l3out": str(params.get("l3out") or ""),
                                },
                            })

                if mod_name == "cisco.aci.aci_vlan_pool_encap_block":
                    start_v = params.get("block_start")
                    end_v = params.get("block_end")
                    pool = str(params.get("pool") or "aci-pool")
                    if str(start_v).isdigit() and str(end_v).isdigit():
                        s_int, e_int = int(start_v), int(end_v)
                        for vid in range(s_int, min(e_int, s_int + 16) + 1):
                            if (vid, pool) not in seen_vlans:
                                seen_vlans.add((vid, pool))
                                records["vlans"].append({
                                    "vid": vid,
                                    "name": f"{pool}-vlan-{vid}",
                                    "description": f"ACI VLAN pool {pool}",
                                })

                if mod_name == "cisco.aci.aci_static_binding_to_epg":
                    vid = parse_encap_vlan(params.get("encap_id"))
                    if vid is not None:
                        epg = str(params.get("epg") or "epg")
                        if (vid, epg) not in seen_vlans:
                            seen_vlans.add((vid, epg))
                            records["vlans"].append({
                                "vid": vid,
                                "name": f"{epg}-vlan-{vid}",
                                "tenant": tenant_name or None,
                                "custom_fields": {
                                    "aci_tenant": tenant_name,
                                    "aci_epg": epg,
                                },
                            })

                if mod_name == "cisco.aci.aci_l4l7_logical_interface":
                    vid = parse_encap_vlan(params.get("encap"))
                    if vid is not None:
                        lif = str(params.get("logical_interface") or "l4l7-lif")
                        if (vid, lif) not in seen_vlans:
                            seen_vlans.add((vid, lif))
                            records["vlans"].append({
                                "vid": vid,
                                "name": f"{lif}-vlan-{vid}",
                                "tenant": tenant_name or None,
                                "custom_fields": {
                                    "aci_tenant": tenant_name,
                                    "aci_service_graph": str(params.get("logical_device") or ""),
                                },
                            })

                if mod_name in ("cisco.aci.aci_contract", "cisco.aci.aci_epg_to_contract", "cisco.aci.aci_l4l7_service_graph_template"):
                    records["custom_field_notes"].append({
                        "module": mod_name,
                        "aci_tenant": tenant_name,
                        "aci_contract": str(params.get("contract") or ""),
                        "aci_epg": str(params.get("epg") or ""),
                        "aci_service_graph": str(params.get("service_graph") or ""),
                    })

    return records


def ensure_tenant(nb: Any, item: dict[str, Any]) -> int:
    existing = nb.tenancy.tenants.get(slug=item["slug"]) or nb.tenancy.tenants.get(name=item["name"])
    if existing:
        return existing.id
    created = nb.tenancy.tenants.create(
        name=item["name"],
        slug=item["slug"],
        description=item.get("description", ""),
    )
    return created.id


def sync_to_netbox(records: dict[str, list[dict[str, Any]]], url: str, token: str) -> None:
    import pynetbox
    nb = pynetbox.api(url=url, token=token)
    tenant_ids: dict[str, int] = {}

    for t in records["tenants"]:
        tenant_ids[t["name"]] = ensure_tenant(nb, t)

    for v in records["vrfs"]:
        t_id = tenant_ids.get(v["tenant"])
        existing = nb.ipam.vrfs.get(name=v["name"])
        if not existing:
            payload: dict[str, Any] = {
                "name": v["name"],
                "enforce_unique": v.get("enforce_unique", True),
            }
            if t_id:
                payload["tenant"] = t_id
            nb.ipam.vrfs.create(**payload)

    for p in records["prefixes"]:
        existing = nb.ipam.prefixes.get(prefix=p["prefix"])
        if not existing:
            payload = {
                "prefix": p["prefix"],
                "description": p.get("description", ""),
            }
            if p.get("tenant") and p["tenant"] in tenant_ids:
                payload["tenant"] = tenant_ids[p["tenant"]]
            nb.ipam.prefixes.create(**payload)

    for vl in records["vlans"]:
        existing = nb.ipam.vlans.get(vid=vl["vid"], name=vl["name"])
        if not existing:
            payload = {
                "vid": vl["vid"],
                "name": vl["name"],
                "description": vl.get("description", ""),
            }
            if vl.get("tenant") and vl["tenant"] in tenant_ids:
                payload["tenant"] = tenant_ids[vl["tenant"]]
            nb.ipam.vlans.create(**payload)


def main() -> int:
    parser = argparse.ArgumentParser(description="Sync Cisco ACI playbook intent to NetBox 4.x")
    parser.add_argument("--playbook", required=True, help="Path to the ACI Ansible playbook YAML")
    parser.add_argument("--dry-run", action="store_true", help="Print extracted NetBox 4.x payload without calling NetBox")
    args = parser.parse_args()

    records = extract_netbox_records(Path(args.playbook))
    if args.dry_run:
        print(json.dumps(records, indent=2))
        return 0

    nb_url = os.environ.get("NETBOX_URL", "").strip()
    nb_token = os.environ.get("NETBOX_TOKEN", "").strip()
    if not nb_url or not nb_token:
        print("ERROR: NETBOX_URL and NETBOX_TOKEN environment variables are required.", file=sys.stderr)
        return 2

    sync_to_netbox(records, nb_url, nb_token)
    print(
        f"Synced NetBox 4.x records from {args.playbook}: "
        f"tenants={len(records['tenants'])}, vrfs={len(records['vrfs'])}, "
        f"prefixes={len(records['prefixes'])}, vlans={len(records['vlans'])}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
