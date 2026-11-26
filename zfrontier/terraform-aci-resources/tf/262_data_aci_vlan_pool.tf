# 262 · data source aci_vlan_pool · 2. Access policies
# Data source for ACI VLAN Pool
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_262 = yamldecode(file("${path.module}/../models/data_aci_vlan_pool.yml"))["data_aci_vlan_pool"]
}

data "aci_vlan_pool" "n262" {
  alloc_mode  = local.m_262["alloc_mode"]
  annotation  = local.m_262["annotation"]
  description = local.m_262["description"]
  name        = local.m_262["name"]
  name_alias  = local.m_262["name_alias"]
}

output "n262_data_aci_vlan_pool_id" {
  value = data.aci_vlan_pool.n262.id
}
