# Cisco ACI Multi-Site, Nexus Dashboard Orchestrator & ISN CI/CD Pack

Copy this folder into your dedicated Ansible automation repository (do **not** put `aci-multisite-pipeline.yml` inside `.github/workflows/` of the static GitHub Pages documentation repo).

This pack is published as documentation only. It has never been run against a real Nexus Dashboard, NDO, APIC, ISN switch or NetBox from this site. A public GitHub-hosted runner cannot reach a private lab, so **a self-hosted runner** on a machine that can reach those systems is required before any real dry run, apply, or NetBox write.

## Files

- `aci-multisite-pipeline.yml` — Copy to `.github/workflows/aci-multisite-pipeline.yml` in your automation repo. Runs:
  1. `lint` (`ubuntu-latest`): `yamllint` + `ansible-lint` with `cisco.mso`, `cisco.nd`, `cisco.nxos` and `cisco.aci`
  2. `dry-run` (`self-hosted`): `ansible-playbook --check --diff` against NDO, Nexus Dashboard, APICs and ISN Nexus switches, uploading `dry-run.log`
  3. `apply` (`self-hosted`, `environment: aci-production`): pauses for manual GitHub Environment reviewer approval, then applies with `--diff`
  4. `netbox-sync` (`self-hosted`, `environment: aci-production`): runs `netbox_sync.py` with `pynetbox`
- `netbox_sync.py` — Parses `cisco.mso.*`, `cisco.nd.*`, `cisco.nxos.*` and `cisco.aci.*` tasks (tenants, schemas, VRFs, bridge domains, ISN VRFs, VLAN-4 P2P prefixes) and syncs them to NetBox 4.x. Supports `--dry-run`.
- `inventory.yml` — Placeholder-only Ansible inventory (`{{ ndo_host }}`, `{{ ndo_username }}`, `{{ ndo_password }}`, `{{ nd_host }}`, `{{ nd_username }}`, `{{ nd_password }}`, `{{ apic_site1_host }}`, `{{ apic_site2_host }}`, `{{ apic_username }}`, `{{ apic_password }}`, `{{ nxos_isn1_host }}`, `{{ nxos_isn2_host }}`, `{{ nxos_username }}`, `{{ nxos_password }}`).

## Required GitHub Secrets

- `NDO_HOST`, `NDO_USERNAME`, `NDO_PASSWORD`
- `ND_HOST`, `ND_USERNAME`, `ND_PASSWORD`
- `APIC_SITE1_HOST`, `APIC_SITE2_HOST`, `APIC_USERNAME`, `APIC_PASSWORD`
- `NXOS_ISN1_HOST`, `NXOS_ISN2_HOST`, `NXOS_USERNAME`, `NXOS_PASSWORD`
- `NETBOX_URL`, `NETBOX_TOKEN`
