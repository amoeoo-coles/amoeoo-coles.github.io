# 229 · data source fmc_standard_access_list · 2. Objects
# This data source reads the Standard Access List (Access Control List / ACP) Object.
# Reads models/data_fmc_standard_access_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_229 = yamldecode(file("${path.module}/../models/data_fmc_standard_access_list.yml"))["data_fmc_standard_access_list"]
}

data "fmc_standard_access_list" "n229" {
  domain = local.m_229["domain"]
  id     = local.m_229["id"]
  name   = local.m_229["name"]
}

output "n229_data_fmc_standard_access_list_id" {
  value = data.fmc_standard_access_list.n229.id
}
