# 444 · data source aci_l3out_bgp_external_policy · 3. Tenant and networking
# Data source for ACI L3-out BGP External Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_bgp_external_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_444 = yamldecode(file("${path.module}/../models/data_aci_l3out_bgp_external_policy.yml"))["data_aci_l3out_bgp_external_policy"]
}

data "aci_l3out_bgp_external_policy" "n444" {
  annotation    = local.m_444["annotation"]
  description   = local.m_444["description"]
  l3_outside_dn = local.m_444["l3_outside_dn"]
  name_alias    = local.m_444["name_alias"]
}

output "n444_data_aci_l3out_bgp_external_policy_id" {
  value = data.aci_l3out_bgp_external_policy.n444.id
}
