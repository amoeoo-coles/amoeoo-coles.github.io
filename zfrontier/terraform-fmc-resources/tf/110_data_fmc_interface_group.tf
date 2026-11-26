# 110 · data source fmc_interface_group · 2. Objects
# This data source reads the Interface Group.
# Reads models/data_fmc_interface_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/data_fmc_interface_group.yml"))["data_fmc_interface_group"]
}

data "fmc_interface_group" "n110" {
  domain = local.m_110["domain"]
  id = local.m_110["id"]
  name = local.m_110["name"]
}

output "n110_data_fmc_interface_group_id" {
  value = data.fmc_interface_group.n110.id
}
