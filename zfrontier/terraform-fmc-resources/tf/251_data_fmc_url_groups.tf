# 251 · data source fmc_url_groups · 2. Objects
# This data source reads the URL Groups.
# Reads models/data_fmc_url_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_251 = yamldecode(file("${path.module}/../models/data_fmc_url_groups.yml"))["data_fmc_url_groups"]
}

data "fmc_url_groups" "n251" {
  domain = local.m_251["domain"]
  items = local.m_251["items"]
}

output "n251_data_fmc_url_groups_id" {
  value = data.fmc_url_groups.n251.id
}
