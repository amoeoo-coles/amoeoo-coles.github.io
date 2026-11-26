# 153 · data source fmc_networks · 2. Objects
# This data source reads the Networks.
# Reads models/data_fmc_networks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_153 = yamldecode(file("${path.module}/../models/data_fmc_networks.yml"))["data_fmc_networks"]
}

data "fmc_networks" "n153" {
  domain = local.m_153["domain"]
  items = local.m_153["items"]
}

output "n153_data_fmc_networks_id" {
  value = data.fmc_networks.n153.id
}
