# 065 · data source fmc_file_type · 2. Objects
# This data source reads the File Type. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_file_type.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/data_fmc_file_type.yml"))["data_fmc_file_type"]
}

data "fmc_file_type" "n065" {
  domain = local.m_065["domain"]
  id = local.m_065["id"]
  name = local.m_065["name"]
}

output "n065_data_fmc_file_type_id" {
  value = data.fmc_file_type.n065.id
}
