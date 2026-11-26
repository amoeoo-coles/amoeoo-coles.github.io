# 122 · data source fmc_ipv4_prefix_list · 2. Objects
# This data source reads the IPv4 Prefix List.
# Reads models/data_fmc_ipv4_prefix_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_122 = yamldecode(file("${path.module}/../models/data_fmc_ipv4_prefix_list.yml"))["data_fmc_ipv4_prefix_list"]
}

data "fmc_ipv4_prefix_list" "n122" {
  domain = local.m_122["domain"]
  id = local.m_122["id"]
  name = local.m_122["name"]
}

output "n122_data_fmc_ipv4_prefix_list_id" {
  value = data.fmc_ipv4_prefix_list.n122.id
}
