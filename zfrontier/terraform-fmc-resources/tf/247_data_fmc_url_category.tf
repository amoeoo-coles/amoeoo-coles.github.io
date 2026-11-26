# 247 · data source fmc_url_category · 2. Objects
# This data source reads the URL Category.
# Reads models/data_fmc_url_category.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_247 = yamldecode(file("${path.module}/../models/data_fmc_url_category.yml"))["data_fmc_url_category"]
}

data "fmc_url_category" "n247" {
  domain = local.m_247["domain"]
  id     = local.m_247["id"]
  name   = local.m_247["name"]
}

output "n247_data_fmc_url_category_id" {
  value = data.fmc_url_category.n247.id
}
