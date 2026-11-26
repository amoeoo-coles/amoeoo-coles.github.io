# 149 · data source fmc_network_groups · 2. Objects
# This data source reads the Network Groups.
# Reads models/data_fmc_network_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_149 = yamldecode(file("${path.module}/../models/data_fmc_network_groups.yml"))["data_fmc_network_groups"]
}

data "fmc_network_groups" "n149" {
  domain = local.m_149["domain"]
  items  = local.m_149["items"]
}

output "n149_data_fmc_network_groups_id" {
  value = data.fmc_network_groups.n149.id
}
