# ACI bridge-domain flooding models

Illustrative Network-as-Code for the eight bridge-domain flooding scenarios
described on the zFrontier page. The lab tenant is `flood_lab` and the VRF is
`flood_lab_vrf`. These files are meant to look runnable; they have not been
applied to any APIC.

**No credentials are included.** Point the tools at an APIC with environment
variables only:

```bash
export ACI_URL="https://apic.example.invalid"
export ACI_USERNAME="admin"
export ACI_PASSWORD="..."          # do not commit this
export ACI_VALIDATE_CERTS="false"  # or "true" with a trusted certificate
# Terraform also honours ACI_INSECURE=true when you skip TLS verify
```

Do not point these models at the Cisco DevNet Always-On APIC (AOAPIC) unless
you have explicit written approval to write to that shared fabric.

## Layout

- `ansible/` — playbook, inventory, and `vars/scenarios.yml` using
  `cisco.aci.aci_tenant`, `cisco.aci.aci_vrf`, `cisco.aci.aci_bd` and
  `cisco.aci.aci_bd_subnet` (cisco.aci 3.x parameter names).
- `terraform/` — a parametric module using the current CiscoDevNet/aci
  Plugin Framework attributes (`parent_dn`, `l2_unknown_unicast_flooding`,
  `l3_unknown_multicast_flooding`, `multi_destination_flooding`,
  `arp_flooding`, `unicast_routing`, `relation_to_vrf.vrf_name`). Legacy
  names such as `tenant_dn`, `unk_mac_ucast_act`, `unk_mcast_act`,
  `multi_dst_pkt_act` and `arp_flood` are deprecated and are not used.
- `terragrunt/live/` — a `root.hcl` plus one unit per scenario that calls
  the Terraform module with a single-BD `scenarios` map, and an `all`
  unit that creates every BD.

## How to run (after you set the environment variables)

```bash
# Ansible (from ansible/)
ansible-playbook playbook.yml

# Terraform (from terraform/) — all scenarios, or one tfvars file
terraform init
terraform plan -var-file=scenarios/all.tfvars
terraform plan -var-file=scenarios/l3-optimized.tfvars

# Terragrunt (from terragrunt/live/)
terragrunt run --all plan
# or one unit:
cd l3-optimized && terragrunt plan
```

PIM for the multicast scenario is enabled on the BD (`mcastAllow` /
`enable_multicast` / `pim`). You must also enable L3 multicast on the VRF
in a real fabric; that VRF-level object is called out in comments and is
not created here, to keep this set focused on the bridge domain knobs.

Changing L2 Unknown Unicast between Flood and Hardware Proxy is disruptive
on a live BD.
