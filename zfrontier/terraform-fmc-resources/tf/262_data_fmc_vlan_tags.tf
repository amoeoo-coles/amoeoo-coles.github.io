# 262 · data source fmc_vlan_tags · 2. Objects
# This data source reads the VLAN Tags.
# Reads models/data_fmc_vlan_tags.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_262 = yamldecode(file("${path.module}/../models/data_fmc_vlan_tags.yml"))["data_fmc_vlan_tags"]
}

data "fmc_vlan_tags" "n262" {
  domain = local.m_262["domain"]
  items  = local.m_262["items"]
}

output "n262_data_fmc_vlan_tags_id" {
  value = data.fmc_vlan_tags.n262.id
}
