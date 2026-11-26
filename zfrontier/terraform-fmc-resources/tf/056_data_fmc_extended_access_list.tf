# 056 · data source fmc_extended_access_list · 2. Objects
# This data source reads the Extended Access List.
# Reads models/data_fmc_extended_access_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/data_fmc_extended_access_list.yml"))["data_fmc_extended_access_list"]
}

data "fmc_extended_access_list" "n056" {
  domain = local.m_056["domain"]
  id     = local.m_056["id"]
  name   = local.m_056["name"]
}

output "n056_data_fmc_extended_access_list_id" {
  value = data.fmc_extended_access_list.n056.id
}
