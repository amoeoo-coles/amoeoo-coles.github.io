# 143 · data source fmc_network · 2. Objects
# This data source reads the Network.
# Reads models/data_fmc_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_143 = yamldecode(file("${path.module}/../models/data_fmc_network.yml"))["data_fmc_network"]
}

data "fmc_network" "n143" {
  domain = local.m_143["domain"]
  id     = local.m_143["id"]
  name   = local.m_143["name"]
}

output "n143_data_fmc_network_id" {
  value = data.fmc_network.n143.id
}
