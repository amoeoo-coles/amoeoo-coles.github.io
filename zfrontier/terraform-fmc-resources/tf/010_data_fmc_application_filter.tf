# 010 · data source fmc_application_filter · 2. Objects
# This data source reads the Application Filter.
# Reads models/data_fmc_application_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/data_fmc_application_filter.yml"))["data_fmc_application_filter"]
}

data "fmc_application_filter" "n010" {
  domain = local.m_010["domain"]
  id     = local.m_010["id"]
  name   = local.m_010["name"]
}

output "n010_data_fmc_application_filter_id" {
  value = data.fmc_application_filter.n010.id
}
