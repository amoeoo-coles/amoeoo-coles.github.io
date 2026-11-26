# 163 · data source fmc_port_groups · 2. Objects
# This data source reads the Port Groups.
# Reads models/data_fmc_port_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_163 = yamldecode(file("${path.module}/../models/data_fmc_port_groups.yml"))["data_fmc_port_groups"]
}

data "fmc_port_groups" "n163" {
  domain = local.m_163["domain"]
  items = local.m_163["items"]
}

output "n163_data_fmc_port_groups_id" {
  value = data.fmc_port_groups.n163.id
}
