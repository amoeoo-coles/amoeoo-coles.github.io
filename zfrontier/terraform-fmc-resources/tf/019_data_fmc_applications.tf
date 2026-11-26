# 019 · data source fmc_applications · 2. Objects
# This data source reads the Applications.
# Reads models/data_fmc_applications.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/data_fmc_applications.yml"))["data_fmc_applications"]
}

data "fmc_applications" "n019" {
  domain = local.m_019["domain"]
  items  = local.m_019["items"]
}

output "n019_data_fmc_applications_id" {
  value = data.fmc_applications.n019.id
}
