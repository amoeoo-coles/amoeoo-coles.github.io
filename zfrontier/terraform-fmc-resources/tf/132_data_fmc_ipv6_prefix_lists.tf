# 132 · data source fmc_ipv6_prefix_lists · 2. Objects
# This data source reads the IPv6 Prefix Lists.
# Reads models/data_fmc_ipv6_prefix_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_132 = yamldecode(file("${path.module}/../models/data_fmc_ipv6_prefix_lists.yml"))["data_fmc_ipv6_prefix_lists"]
}

data "fmc_ipv6_prefix_lists" "n132" {
  domain = local.m_132["domain"]
  items  = local.m_132["items"]
}

output "n132_data_fmc_ipv6_prefix_lists_id" {
  value = data.fmc_ipv6_prefix_lists.n132.id
}
