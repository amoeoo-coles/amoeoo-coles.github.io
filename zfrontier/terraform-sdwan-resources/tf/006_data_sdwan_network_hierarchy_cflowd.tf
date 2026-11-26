# 006 · data source sdwan_network_hierarchy_cflowd · 2. Network hierarchy and inventory
# This data source can read Network Hierarchy Cflowd settings.
# Reads models/data_sdwan_network_hierarchy_cflowd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_sdwan_network_hierarchy_cflowd.yml"))["data_sdwan_network_hierarchy_cflowd"]
}

data "sdwan_network_hierarchy_cflowd" "n006" {
  id = local.m_006["id"]
}

output "n006_data_sdwan_network_hierarchy_cflowd_id" {
  value = data.sdwan_network_hierarchy_cflowd.n006.id
}
