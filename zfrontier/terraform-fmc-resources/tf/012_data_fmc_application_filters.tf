# 012 · data source fmc_application_filters · 2. Objects
# This data source reads the Application Filters.
# Reads models/data_fmc_application_filters.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/data_fmc_application_filters.yml"))["data_fmc_application_filters"]
}

data "fmc_application_filters" "n012" {
  domain = local.m_012["domain"]
  items  = local.m_012["items"]
}

output "n012_data_fmc_application_filters_id" {
  value = data.fmc_application_filters.n012.id
}
