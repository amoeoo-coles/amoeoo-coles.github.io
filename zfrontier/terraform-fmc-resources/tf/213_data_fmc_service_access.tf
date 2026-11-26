# 213 · data source fmc_service_access · 2. Objects
# This data source reads the Service Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_service_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_213 = yamldecode(file("${path.module}/../models/data_fmc_service_access.yml"))["data_fmc_service_access"]
}

data "fmc_service_access" "n213" {
  domain = local.m_213["domain"]
  id = local.m_213["id"]
  name = local.m_213["name"]
}

output "n213_data_fmc_service_access_id" {
  value = data.fmc_service_access.n213.id
}
