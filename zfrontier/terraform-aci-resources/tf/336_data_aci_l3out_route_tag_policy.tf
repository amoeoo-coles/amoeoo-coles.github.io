# 336 · data source aci_l3out_route_tag_policy · 3. Tenant and networking
# Data source for ACI L3out Route Tag Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_route_tag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_336 = yamldecode(file("${path.module}/../models/data_aci_l3out_route_tag_policy.yml"))["data_aci_l3out_route_tag_policy"]
}

data "aci_l3out_route_tag_policy" "n336" {
  annotation  = local.m_336["annotation"]
  description = local.m_336["description"]
  name        = local.m_336["name"]
  name_alias  = local.m_336["name_alias"]
  tag         = local.m_336["tag"]
  tenant_dn   = local.m_336["tenant_dn"]
}

output "n336_data_aci_l3out_route_tag_policy_id" {
  value = data.aci_l3out_route_tag_policy.n336.id
}
