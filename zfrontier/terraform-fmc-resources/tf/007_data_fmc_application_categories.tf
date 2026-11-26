# 007 · data source fmc_application_categories · 2. Objects
# This data source reads the Application Categories.
# Reads models/data_fmc_application_categories.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/data_fmc_application_categories.yml"))["data_fmc_application_categories"]
}

data "fmc_application_categories" "n007" {
  domain = local.m_007["domain"]
  items  = local.m_007["items"]
}

output "n007_data_fmc_application_categories_id" {
  value = data.fmc_application_categories.n007.id
}
