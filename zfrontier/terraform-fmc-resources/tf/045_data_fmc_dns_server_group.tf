# 045 · data source fmc_dns_server_group · 2. Objects
# This data source reads the DNS Server Group.
# Reads models/data_fmc_dns_server_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_045 = yamldecode(file("${path.module}/../models/data_fmc_dns_server_group.yml"))["data_fmc_dns_server_group"]
}

data "fmc_dns_server_group" "n045" {
  domain = local.m_045["domain"]
  id = local.m_045["id"]
  name = local.m_045["name"]
}

output "n045_data_fmc_dns_server_group_id" {
  value = data.fmc_dns_server_group.n045.id
}
