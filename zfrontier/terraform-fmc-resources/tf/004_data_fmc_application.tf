# 004 · data source fmc_application · 2. Objects
# This data source reads the Application.
# Reads models/data_fmc_application.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_fmc_application.yml"))["data_fmc_application"]
}

data "fmc_application" "n004" {
  domain = local.m_004["domain"]
  id = local.m_004["id"]
  name = local.m_004["name"]
}

output "n004_data_fmc_application_id" {
  value = data.fmc_application.n004.id
}
