# 130 · data source fmc_ipv6_prefix_list · 2. Objects
# This data source reads the IPv6 Prefix List.
# Reads models/data_fmc_ipv6_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_130 = yamldecode(file("${path.module}/../models/data_fmc_ipv6_prefix_list.yml"))["data_fmc_ipv6_prefix_list"]
}

data "fmc_ipv6_prefix_list" "n130" {
  domain = local.m_130["domain"]
  id     = local.m_130["id"]
  name   = local.m_130["name"]
}

output "n130_data_fmc_ipv6_prefix_list_id" {
  value = data.fmc_ipv6_prefix_list.n130.id
}
