# 013 · data source fmc_application_risk · 2. Objects
# This data source reads the Application Risk level.
# Reads models/data_fmc_application_risk.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/data_fmc_application_risk.yml"))["data_fmc_application_risk"]
}

data "fmc_application_risk" "n013" {
  domain = local.m_013["domain"]
  id     = local.m_013["id"]
  name   = local.m_013["name"]
}

output "n013_data_fmc_application_risk_id" {
  value = data.fmc_application_risk.n013.id
}
