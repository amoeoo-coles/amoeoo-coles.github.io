# 151 · data source fmc_network_overrides · 2. Objects
# This data source reads the Network Overrides.
# Reads models/data_fmc_network_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_151 = yamldecode(file("${path.module}/../models/data_fmc_network_overrides.yml"))["data_fmc_network_overrides"]
}

data "fmc_network_overrides" "n151" {
  domain = local.m_151["domain"]
  id = local.m_151["id"]
  parent_name = local.m_151["parent_name"]
}

output "n151_data_fmc_network_overrides_id" {
  value = data.fmc_network_overrides.n151.id
}
