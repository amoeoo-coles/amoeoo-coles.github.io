# 147 · data source fmc_network_group_overrides · 2. Objects
# This data source reads the Network Group Overrides.
# Reads models/data_fmc_network_group_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_147 = yamldecode(file("${path.module}/../models/data_fmc_network_group_overrides.yml"))["data_fmc_network_group_overrides"]
}

data "fmc_network_group_overrides" "n147" {
  domain      = local.m_147["domain"]
  id          = local.m_147["id"]
  parent_name = local.m_147["parent_name"]
}

output "n147_data_fmc_network_group_overrides_id" {
  value = data.fmc_network_group_overrides.n147.id
}
