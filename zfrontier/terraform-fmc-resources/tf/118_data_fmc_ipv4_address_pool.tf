# 118 · data source fmc_ipv4_address_pool · 2. Objects
# This data source reads the IPv4 Address Pool.
# Reads models/data_fmc_ipv4_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_118 = yamldecode(file("${path.module}/../models/data_fmc_ipv4_address_pool.yml"))["data_fmc_ipv4_address_pool"]
}

data "fmc_ipv4_address_pool" "n118" {
  domain = local.m_118["domain"]
  id     = local.m_118["id"]
  name   = local.m_118["name"]
}

output "n118_data_fmc_ipv4_address_pool_id" {
  value = data.fmc_ipv4_address_pool.n118.id
}
