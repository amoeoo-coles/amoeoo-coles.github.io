# Cisco ACI Multi-Pod & Nexus IPN CI/CD Pack

Copy this folder into your dedicated Ansible automation repository (do **not** put `aci-multipod-pipeline.yml` inside `.github/workflows/` of the static GitHub Pages documentation repo).

## Files

- `aci-multipod-pipeline.yml` — Copy to `.github/workflows/aci-multipod-pipeline.yml` in your automation repo. Runs:
  1. `lint` (`ubuntu-latest`): `yamllint` + `ansible-lint` with `cisco.aci` and `cisco.nxos`
  2. `dry-run` (`self-hosted`): `ansible-playbook --check --diff` against APIC and IPN Nexus switches, uploading `dry-run.log`
  3. `apply` (`self-hosted`, `environment: aci-production`): pauses for manual GitHub Environment reviewer approval, then applies with `--diff`
  4. `netbox-sync` (`self-hosted`, `environment: aci-production`): runs `netbox_sync.py` with `pynetbox`
- `netbox_sync.py` — Parses both `cisco.aci.*` and `cisco.nxos.*` tasks (including Multi-Pod TEP pools, spine routable prefixes, IPN VRFs, and VLAN-4 P2P links) and syncs them to NetBox 4.x. Supports `--dry-run`.
- `inventory.yml` — Placeholder-only Ansible inventory (`{{ apic_host }}`, `{{ apic_username }}`, `{{ apic_password }}`, `{{ nxos_ipn1_host }}`, `{{ nxos_ipn2_host }}`, `{{ nxos_username }}`, `{{ nxos_password }}`).

## Required GitHub Secrets

- `APIC_HOST`, `APIC_USERNAME`, `APIC_PASSWORD`
- `NXOS_IPN1_HOST`, `NXOS_IPN2_HOST`, `NXOS_USERNAME`, `NXOS_PASSWORD`
- `NETBOX_URL`, `NETBOX_TOKEN`
