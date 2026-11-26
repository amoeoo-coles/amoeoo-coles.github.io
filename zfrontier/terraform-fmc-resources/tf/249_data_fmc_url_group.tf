# 249 · data source fmc_url_group · 2. Objects
# This data source reads the URL Group.
# Reads models/data_fmc_url_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_249 = yamldecode(file("${path.module}/../models/data_fmc_url_group.yml"))["data_fmc_url_group"]
}

data "fmc_url_group" "n249" {
  domain = local.m_249["domain"]
  id     = local.m_249["id"]
  name   = local.m_249["name"]
}

output "n249_data_fmc_url_group_id" {
  value = data.fmc_url_group.n249.id
}
