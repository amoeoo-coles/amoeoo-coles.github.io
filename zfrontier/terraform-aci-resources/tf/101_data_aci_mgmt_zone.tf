# 101 · data source aci_mgmt_zone · 1. System and fabric setup
# Data source for ACI Management Zone
# APIC class: not collected · DN: not collected
# Reads models/data_aci_mgmt_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/data_aci_mgmt_zone.yml"))["data_aci_mgmt_zone"]
}

data "aci_mgmt_zone" "n101" {
  annotation                         = local.m_101["annotation"]
  description                        = local.m_101["description"]
  managed_node_connectivity_group_dn = local.m_101["managed_node_connectivity_group_dn"]
  name                               = local.m_101["name"]
  name_alias                         = local.m_101["name_alias"]
  type                               = local.m_101["type"]
}

output "n101_data_aci_mgmt_zone_id" {
  value = data.aci_mgmt_zone.n101.id
}
