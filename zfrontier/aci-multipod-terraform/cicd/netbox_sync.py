#!/usr/bin/env python3
"""Sync Terraform plan JSON (or a values YAML) to NetBox 4.x via pynetbox.

Reads NETBOX_URL and NETBOX_TOKEN from the environment (CI secrets). Designed
to be copied into a private automation repository. This script never prints
secret values.

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

try:
    import yaml
except ImportError:  # pragma: no cover
    yaml = None


def slugify(value: str) -> str:
    slug = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return slug or "aci-object"


def _try_prefix(text: str) -> str | None:
    text = str(text).strip().strip('"').strip("'")
    try:
        return str(ipaddress.ip_network(text, strict=False))
    except ValueError:
        return None


def _try_ip(text: str) -> str | None:
    text = str(text).strip().strip('"').strip("'")
    try:
        return str(ipaddress.ip_interface(text))
    except ValueError:
        return None


def records_template() -> dict[str, list[dict[str, Any]]]:
    return {"tenants": [], "vrfs": [], "prefixes": [], "vlans": [], "ip_addresses": [], "sites": []}


def extract_from_plan(plan: dict[str, Any]) -> dict[str, list[dict[str, Any]]]:
    records = records_template()
    seen_t, seen_v, seen_p, seen_i, seen_s = set(), set(), set(), set(), set()
    for ch in plan.get("resource_changes") or []:
        change = ch.get("change") or {}
        after = change.get("after") or {}
        kind = ch.get("type") or ""
        if kind in {"aci_tenant", "mso_tenant"}:
            name = str(after.get("name") or "").strip()
            if name and name not in seen_t:
                seen_t.add(name)
                records["tenants"].append({
                    "name": name,
                    "slug": slugify(name),
                    "description": f"ACI/NDO tenant {name}",
                })
        if kind in {"mso_site"}:
            name = str(after.get("name") or after.get("site_name") or "").strip()
            if name and name not in seen_s:
                seen_s.add(name)
                records["sites"].append({"name": name, "slug": slugify(name)})
        if kind in {"aci_vrf", "mso_schema_template_vrf", "nxos_vrf"}:
            name = str(after.get("name") or after.get("vrf") or "").strip()
            tenant = str(after.get("tenant") or "").strip() or "common"
            key = (tenant, name)
            if name and key not in seen_v:
                seen_v.add(key)
                records["vrfs"].append({
                    "name": f"{tenant}:{name}",
                    "tenant": tenant,
                    "custom_fields": {"aci_tenant": tenant, "aci_vrf": name},
                })

        def walk(obj: Any, hint: str = "") -> None:
            if isinstance(obj, dict):
                for k, v in obj.items():
                    walk(v, hint=str(k))
            elif isinstance(obj, list):
                for item in obj:
                    walk(item, hint=hint)
            elif isinstance(obj, str):
                pref = _try_prefix(obj)
                if pref and obj not in seen_p and obj not in seen_i:
                    if obj.endswith("/32") or obj.endswith("/128"):
                        seen_i.add(obj)
                        records["ip_addresses"].append({"address": obj, "description": hint})
                    else:
                        seen_p.add(obj)
                        records["prefixes"].append({"prefix": pref, "description": hint or "from terraform plan"})

        walk(after)
        if isinstance(after.get("content"), dict):
            walk(after["content"], hint=kind)
    return records


def extract_from_hcl(text: str) -> dict[str, list[dict[str, Any]]]:
    records = records_template()
    seen_p, seen_i = set(), set()
    for cidr in re.findall(r'"((?:\d{1,3}\.){3}\d{1,3}/\d{1,2})"', text):
        pref = _try_prefix(cidr)
        if not pref:
            continue
        if cidr.endswith("/32"):
            if cidr not in seen_i:
                seen_i.add(cidr)
                records["ip_addresses"].append({"address": cidr, "description": "parsed from HCL"})
        elif cidr not in seen_p:
            seen_p.add(cidr)
            records["prefixes"].append({"prefix": pref, "description": "parsed from HCL"})
    for match in re.finditer(
        r'resource\s+"aci_tenant"\s+"[^"]+"\s*\{[^}]*name\s*=\s*"([^"]+)"',
        text,
        re.S,
    ):
        records["tenants"].append({"name": match.group(1), "slug": slugify(match.group(1))})
    return records


def extract_from_values_yaml(path: Path) -> dict[str, list[dict[str, Any]]]:
    if yaml is None:
        raise SystemExit("PyYAML is required to parse --values-yaml")
    data = yaml.safe_load(path.read_text(encoding="utf-8")) or {}
    records = records_template()
    seen_p: set[str] = set()

    def walk(obj: Any, hint: str = "") -> None:
        if isinstance(obj, dict):
            if obj.get("tenant"):
                name = str(obj["tenant"])
                records["tenants"].append({"name": name, "slug": slugify(name)})
            for key, value in obj.items():
                walk(value, hint=str(key))
        elif isinstance(obj, list):
            for item in obj:
                walk(item, hint=hint)
        elif isinstance(obj, str):
            pref = _try_prefix(obj)
            if pref and obj not in seen_p:
                seen_p.add(obj)
                if obj.endswith("/32"):
                    records["ip_addresses"].append({"address": obj, "description": hint})
                else:
                    records["prefixes"].append({"prefix": pref, "description": hint})

    walk(data)
    return records


def sync_to_netbox(records: dict[str, list[dict[str, Any]]], dry_run: bool = False) -> None:
    if dry_run:
        json.dump(records, sys.stdout, indent=2)
        sys.stdout.write("\n")
        return
    url = os.environ.get("NETBOX_URL") or ""
    token = os.environ.get("NETBOX_TOKEN") or ""
    if not url or not token:
        raise SystemExit("NETBOX_URL and NETBOX_TOKEN must be set to sync (or pass --dry-run).")
    try:
        import pynetbox
    except ImportError as exc:
        raise SystemExit("pynetbox is required for a live sync") from exc
    nb = pynetbox.api(url, token=token)
    for tenant in records["tenants"]:
        existing = nb.tenancy.tenants.get(slug=tenant["slug"])
        if existing:
            existing.update(tenant)
        else:
            nb.tenancy.tenants.create(tenant)
    for site in records.get("sites") or []:
        existing = nb.dcim.sites.get(slug=site["slug"])
        if existing:
            existing.update(site)
        else:
            nb.dcim.sites.create(site)
    for vrf in records["vrfs"]:
        existing = nb.ipam.vrfs.get(name=vrf["name"])
        if existing:
            existing.update(vrf)
        else:
            nb.ipam.vrfs.create(vrf)
    for prefix in records["prefixes"]:
        existing = nb.ipam.prefixes.get(prefix=prefix["prefix"])
        if existing:
            existing.update(prefix)
        else:
            nb.ipam.prefixes.create(prefix)
    for ip in records["ip_addresses"]:
        existing = nb.ipam.ip_addresses.get(address=ip["address"])
        if existing:
            existing.update(ip)
        else:
            nb.ipam.ip_addresses.create(ip)
    for vlan in records["vlans"]:
        existing = nb.ipam.vlans.get(vid=vlan.get("vid"), name=vlan.get("name"))
        if existing:
            existing.update(vlan)
        else:
            nb.ipam.vlans.create(vlan)


def main() -> int:
    parser = argparse.ArgumentParser(description="Sync Terraform plan or values to NetBox 4.x")
    parser.add_argument("--plan-json", type=Path, help="terraform show -json output")
    parser.add_argument("--tf", type=Path, help="A generated .tf file to parse loosely")
    parser.add_argument("--values-yaml", type=Path, help="data/sample.yml or similar")
    parser.add_argument("--dry-run", action="store_true", help="Print payloads without calling NetBox")
    args = parser.parse_args()
    if not any([args.plan_json, args.tf, args.values_yaml]):
        parser.error("Provide --plan-json, --tf or --values-yaml")
    if args.plan_json:
        plan = json.loads(args.plan_json.read_text(encoding="utf-8"))
        records = extract_from_plan(plan)
    elif args.tf:
        records = extract_from_hcl(args.tf.read_text(encoding="utf-8"))
    else:
        records = extract_from_values_yaml(args.values_yaml)
    sync_to_netbox(records, dry_run=args.dry_run)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
