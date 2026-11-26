# 084 · data source fmc_hosts · 2. Objects
# This data source reads the Hosts.
# Reads models/data_fmc_hosts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/data_fmc_hosts.yml"))["data_fmc_hosts"]
}

data "fmc_hosts" "n084" {
  domain = local.m_084["domain"]
  items  = local.m_084["items"]
}

output "n084_data_fmc_hosts_id" {
  value = data.fmc_hosts.n084.id
}
