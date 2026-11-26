# 066 · data source fmc_file_types · 2. Objects
# This data source reads the File Types. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_file_types.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/data_fmc_file_types.yml"))["data_fmc_file_types"]
}

data "fmc_file_types" "n066" {
  domain = local.m_066["domain"]
  items  = local.m_066["items"]
}

output "n066_data_fmc_file_types_id" {
  value = data.fmc_file_types.n066.id
}
