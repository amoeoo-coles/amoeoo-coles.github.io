# 246 · data source fmc_url_categories · 2. Objects
# This data source reads the URL Categories.
# Reads models/data_fmc_url_categories.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_246 = yamldecode(file("${path.module}/../models/data_fmc_url_categories.yml"))["data_fmc_url_categories"]
}

data "fmc_url_categories" "n246" {
  domain = local.m_246["domain"]
  items  = local.m_246["items"]
}

output "n246_data_fmc_url_categories_id" {
  value = data.fmc_url_categories.n246.id
}
