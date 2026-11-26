# 145 · data source fmc_network_group · 2. Objects
# This data source reads the Network Group.
# Reads models/data_fmc_network_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_145 = yamldecode(file("${path.module}/../models/data_fmc_network_group.yml"))["data_fmc_network_group"]
}

data "fmc_network_group" "n145" {
  domain = local.m_145["domain"]
  id = local.m_145["id"]
  name = local.m_145["name"]
}

output "n145_data_fmc_network_group_id" {
  value = data.fmc_network_group.n145.id
}
