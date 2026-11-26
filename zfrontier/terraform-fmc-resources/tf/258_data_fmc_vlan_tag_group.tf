# 258 · data source fmc_vlan_tag_group · 2. Objects
# This data source reads the VLAN Tag Group.
# Reads models/data_fmc_vlan_tag_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_258 = yamldecode(file("${path.module}/../models/data_fmc_vlan_tag_group.yml"))["data_fmc_vlan_tag_group"]
}

data "fmc_vlan_tag_group" "n258" {
  domain = local.m_258["domain"]
  id = local.m_258["id"]
  name = local.m_258["name"]
}

output "n258_data_fmc_vlan_tag_group_id" {
  value = data.fmc_vlan_tag_group.n258.id
}
