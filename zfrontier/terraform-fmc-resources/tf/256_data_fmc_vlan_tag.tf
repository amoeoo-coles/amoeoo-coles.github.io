# 256 · data source fmc_vlan_tag · 2. Objects
# This data source reads the VLAN Tag.
# Reads models/data_fmc_vlan_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_256 = yamldecode(file("${path.module}/../models/data_fmc_vlan_tag.yml"))["data_fmc_vlan_tag"]
}

data "fmc_vlan_tag" "n256" {
  domain = local.m_256["domain"]
  id = local.m_256["id"]
  name = local.m_256["name"]
}

output "n256_data_fmc_vlan_tag_id" {
  value = data.fmc_vlan_tag.n256.id
}
