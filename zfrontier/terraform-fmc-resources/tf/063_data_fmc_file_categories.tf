# 063 · data source fmc_file_categories · 2. Objects
# This data source reads the File Categories. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_file_categories.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_063 = yamldecode(file("${path.module}/../models/data_fmc_file_categories.yml"))["data_fmc_file_categories"]
}

data "fmc_file_categories" "n063" {
  domain = local.m_063["domain"]
  items  = local.m_063["items"]
}

output "n063_data_fmc_file_categories_id" {
  value = data.fmc_file_categories.n063.id
}
