# 126 · data source fmc_ipv6_address_pool · 2. Objects
# This data source reads the IPv6 Address Pool.
# Reads models/data_fmc_ipv6_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_126 = yamldecode(file("${path.module}/../models/data_fmc_ipv6_address_pool.yml"))["data_fmc_ipv6_address_pool"]
}

data "fmc_ipv6_address_pool" "n126" {
  domain = local.m_126["domain"]
  id = local.m_126["id"]
  name = local.m_126["name"]
}

output "n126_data_fmc_ipv6_address_pool_id" {
  value = data.fmc_ipv6_address_pool.n126.id
}
