# Cisco ACI Ansible + NetBox 4.x CI/CD Pack

Copy this folder into your dedicated Ansible automation repository (do **not** put `aci-pipeline.yml` inside `.github/workflows/` of the static GitHub Pages documentation repo).

## Files

- `aci-pipeline.yml` — Copy to `.github/workflows/aci-pipeline.yml` in your automation repo. Runs:
  1. `lint` (`ubuntu-latest`): `yamllint` + `ansible-lint`
  2. `dry-run` (`self-hosted`): `ansible-playbook --check --diff` against APIC and uploads `dry-run.log` as a workflow artifact
  3. `apply` (`self-hosted`, `environment: aci-production`): pauses for manual GitHub Environment reviewer approval, then applies with `--diff`
  4. `netbox-sync` (`self-hosted`, `environment: aci-production`): runs `netbox_sync.py` with `pynetbox`
- `netbox_sync.py` — Parses the applied ACI playbook and creates/updates matching NetBox 4.x `tenancy.tenants`, `ipam.vrfs`, `ipam.prefixes`, and `ipam.vlans`. Supports `--dry-run` for local inspection.
- `inventory.yml` — Placeholder-only Ansible inventory (`{{ apic_host }}`, `{{ apic_username }}`, `{{ apic_password }}`).

## Required GitHub Secrets & Environment Protection

1. Create GitHub Environment `aci-production` with **Required reviewers** enabled so `apply` pauses until an operator inspects the `aci-dry-run-log` artifact and approves.
2. Add secrets (repository or `aci-production` environment):
   - `APIC_HOST` — APIC IP/FQDN reachable from your `self-hosted` runner
   - `APIC_USERNAME` — APIC automation username
   - `APIC_PASSWORD` — APIC automation password
   - `NETBOX_URL` — NetBox 4.x base URL (e.g. `https://netbox.example.invalid`)
   - `NETBOX_TOKEN` — NetBox API token with write access to Tenancy and IPAM
3. Optional NetBox 4.x custom fields for ACI traceability:
   - `aci_tenant`, `aci_vrf`, `aci_bd`, `aci_epg`, `aci_contract`, `aci_l3out`, `aci_service_graph` (type: Text).
