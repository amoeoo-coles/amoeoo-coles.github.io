# 161 · data source fmc_port_group · 2. Objects
# This data source reads the Port Group.
# Reads models/data_fmc_port_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_161 = yamldecode(file("${path.module}/../models/data_fmc_port_group.yml"))["data_fmc_port_group"]
}

data "fmc_port_group" "n161" {
  domain = local.m_161["domain"]
  id = local.m_161["id"]
  name = local.m_161["name"]
}

output "n161_data_fmc_port_group_id" {
  value = data.fmc_port_group.n161.id
}
