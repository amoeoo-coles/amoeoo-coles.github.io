# 270 · data source aci_vxlan_pool · 2. Access policies
# Data source for ACI VXLAN Pool
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vxlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_270 = yamldecode(file("${path.module}/../models/data_aci_vxlan_pool.yml"))["data_aci_vxlan_pool"]
}

data "aci_vxlan_pool" "n270" {
  annotation  = local.m_270["annotation"]
  description = local.m_270["description"]
  name        = local.m_270["name"]
  name_alias  = local.m_270["name_alias"]
}

output "n270_data_aci_vxlan_pool_id" {
  value = data.aci_vxlan_pool.n270.id
}
