# 448 · data source aci_l3out_ospf_external_policy · 3. Tenant and networking
# Data source for ACI L3-out OSPF External Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_ospf_external_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_448 = yamldecode(file("${path.module}/../models/data_aci_l3out_ospf_external_policy.yml"))["data_aci_l3out_ospf_external_policy"]
}

data "aci_l3out_ospf_external_policy" "n448" {
  annotation        = local.m_448["annotation"]
  area_cost         = local.m_448["area_cost"]
  area_ctrl         = local.m_448["area_ctrl"]
  area_id           = local.m_448["area_id"]
  area_type         = local.m_448["area_type"]
  description       = local.m_448["description"]
  l3_outside_dn     = local.m_448["l3_outside_dn"]
  multipod_internal = local.m_448["multipod_internal"]
  name_alias        = local.m_448["name_alias"]
}

output "n448_data_aci_l3out_ospf_external_policy_id" {
  value = data.aci_l3out_ospf_external_policy.n448.id
}
