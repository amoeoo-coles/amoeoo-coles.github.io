# 124 · data source fmc_ipv4_prefix_lists · 2. Objects
# This data source reads the IPv4 Prefix Lists.
# Reads models/data_fmc_ipv4_prefix_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_124 = yamldecode(file("${path.module}/../models/data_fmc_ipv4_prefix_lists.yml"))["data_fmc_ipv4_prefix_lists"]
}

data "fmc_ipv4_prefix_lists" "n124" {
  domain = local.m_124["domain"]
  items  = local.m_124["items"]
}

output "n124_data_fmc_ipv4_prefix_lists_id" {
  value = data.fmc_ipv4_prefix_lists.n124.id
}
