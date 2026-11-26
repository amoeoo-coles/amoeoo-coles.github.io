# 017 · data source fmc_application_type · 2. Objects
# This data source reads the Application Type.
# Reads models/data_fmc_application_type.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/data_fmc_application_type.yml"))["data_fmc_application_type"]
}

data "fmc_application_type" "n017" {
  domain = local.m_017["domain"]
  id = local.m_017["id"]
  name = local.m_017["name"]
}

output "n017_data_fmc_application_type_id" {
  value = data.fmc_application_type.n017.id
}
