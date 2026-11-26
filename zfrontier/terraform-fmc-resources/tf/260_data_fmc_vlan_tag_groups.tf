# 260 · data source fmc_vlan_tag_groups · 2. Objects
# This data source reads the VLAN Tag Groups.
# Reads models/data_fmc_vlan_tag_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_260 = yamldecode(file("${path.module}/../models/data_fmc_vlan_tag_groups.yml"))["data_fmc_vlan_tag_groups"]
}

data "fmc_vlan_tag_groups" "n260" {
  domain = local.m_260["domain"]
  items = local.m_260["items"]
}

output "n260_data_fmc_vlan_tag_groups_id" {
  value = data.fmc_vlan_tag_groups.n260.id
}
