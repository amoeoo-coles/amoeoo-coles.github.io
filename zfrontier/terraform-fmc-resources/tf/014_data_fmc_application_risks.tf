# 014 · data source fmc_application_risks · 2. Objects
# This data source reads the Application Risk levels.
# Reads models/data_fmc_application_risks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/data_fmc_application_risks.yml"))["data_fmc_application_risks"]
}

data "fmc_application_risks" "n014" {
  domain = local.m_014["domain"]
  items = local.m_014["items"]
}

output "n014_data_fmc_application_risks_id" {
  value = data.fmc_application_risks.n014.id
}
