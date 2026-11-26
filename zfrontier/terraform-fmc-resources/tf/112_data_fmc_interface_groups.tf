# 112 · data source fmc_interface_groups · 2. Objects
# This data source reads the Interface Groups.
# Reads models/data_fmc_interface_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/data_fmc_interface_groups.yml"))["data_fmc_interface_groups"]
}

data "fmc_interface_groups" "n112" {
  domain = local.m_112["domain"]
  items  = local.m_112["items"]
}

output "n112_data_fmc_interface_groups_id" {
  value = data.fmc_interface_groups.n112.id
}
