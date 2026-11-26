# 064 · data source fmc_file_category · 2. Objects
# This data source reads the File Category. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_file_category.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/data_fmc_file_category.yml"))["data_fmc_file_category"]
}

data "fmc_file_category" "n064" {
  domain = local.m_064["domain"]
  id     = local.m_064["id"]
  name   = local.m_064["name"]
}

output "n064_data_fmc_file_category_id" {
  value = data.fmc_file_category.n064.id
}
