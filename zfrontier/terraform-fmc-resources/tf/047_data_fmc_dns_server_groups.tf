# 047 · data source fmc_dns_server_groups · 2. Objects
# This data source reads the DNS Server Groups.
# Reads models/data_fmc_dns_server_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_047 = yamldecode(file("${path.module}/../models/data_fmc_dns_server_groups.yml"))["data_fmc_dns_server_groups"]
}

data "fmc_dns_server_groups" "n047" {
  domain = local.m_047["domain"]
  items  = local.m_047["items"]
}

output "n047_data_fmc_dns_server_groups_id" {
  value = data.fmc_dns_server_groups.n047.id
}
