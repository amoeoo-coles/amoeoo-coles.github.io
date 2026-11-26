# 248 · data source aci_ranges · 2. Access policies
# Data source for ACI VLAN Pool Ranges
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_248 = yamldecode(file("${path.module}/../models/data_aci_ranges.yml"))["data_aci_ranges"]
}

data "aci_ranges" "n248" {
  alloc_mode   = local.m_248["alloc_mode"]
  annotation   = local.m_248["annotation"]
  description  = local.m_248["description"]
  from         = local.m_248["from"]
  name_alias   = local.m_248["name_alias"]
  role         = local.m_248["role"]
  to           = local.m_248["to"]
  vlan_pool_dn = local.m_248["vlan_pool_dn"]
}

output "n248_data_aci_ranges_id" {
  value = data.aci_ranges.n248.id
}
