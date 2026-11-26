# 443 · resource aci_l3out_bgp_external_policy · 3. Tenant and networking
# Manages ACI L3-out BGP External Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_bgp_external_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_443 = yamldecode(file("${path.module}/../models/aci_l3out_bgp_external_policy.yml"))["aci_l3out_bgp_external_policy"]
}

resource "aci_l3out_bgp_external_policy" "n443" {
  annotation    = local.m_443["annotation"]
  description   = local.m_443["description"]
  l3_outside_dn = local.m_443["l3_outside_dn"]
  name_alias    = local.m_443["name_alias"]
}
