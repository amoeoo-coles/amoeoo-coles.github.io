# 018 · data source fmc_application_types · 2. Objects
# This data source reads the Application Types.
# Reads models/data_fmc_application_types.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/data_fmc_application_types.yml"))["data_fmc_application_types"]
}

data "fmc_application_types" "n018" {
  domain = local.m_018["domain"]
  items  = local.m_018["items"]
}

output "n018_data_fmc_application_types_id" {
  value = data.fmc_application_types.n018.id
}
