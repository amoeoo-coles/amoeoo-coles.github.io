# Multi-VRF firewall insertion — example Ansible series

These files are an example, data-driven series for a two-VRF firewall
service-insertion design. They target the Cisco ACI `cisco.aci` collection
and are published with the hidden page at
`/zfrontier/multi-vrf-firewall-insertion/`.

## Safety

- Credentials are placeholders only. The password is always `{{ apic_password }}`
  and must be supplied at runtime. Do not write a real password, token or
  production APIC address into these files.
- Playbooks 01-06 would change fabric policy if they were run. Playbook 07 is
  read-only.
- Do not run any of these playbooks against a production APIC. Start with
  `ansible-playbook --syntax-check` on each file.
- Node IDs, ports, VLANs, subnets, firewall IP addresses and MAC addresses are
  **example addressing**. Production port-channel, vPC, VLAN and firewall
  interface details depend on the service-insertion design used in that fabric.

## Layout

- `inventory.yml` — example inventory (`lab-apic`, local connection).
- `group_vars/apic.yml` — placeholder `apic_host`, `apic_username` and
  `apic_validate_certs`. `apic_password` is not set here.
- `vars/access.yml` — VLAN pool, physical domain, AAEP, vPC Po1, server ports.
- `vars/tenant.yml` — tenant, VRFs, bridge domains, subnets, EPGs.
- `vars/l4l7.yml` — logical/concrete devices, PBR destinations, graphs, contracts.
- `01-access-policies.yml` … `07-validate.yml` — run in that order.

## Syntax check

From this directory, with `cisco.aci` installed:

```bash
for f in 0*.yml; do
  ansible-playbook --syntax-check "$f"
done
```

To pass login values at runtime (lab only):

```bash
ansible-playbook 07-validate.yml \
  -e apic_host=apic.example.invalid \
  -e apic_username=admin \
  -e apic_password='...'
```

The collection used to author and syntax-check this series is `cisco.aci` 3.0.0.
Module names follow that collection. Note that the destination module is
`aci_l4l7_policy_based_redirect_destination` (singular).
