# 038 · data source fmc_continents · 2. Objects
# This data source reads the Continents.
# Reads models/data_fmc_continents.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_038 = yamldecode(file("${path.module}/../models/data_fmc_continents.yml"))["data_fmc_continents"]
}

data "fmc_continents" "n038" {
  domain = local.m_038["domain"]
  items = local.m_038["items"]
}

output "n038_data_fmc_continents_id" {
  value = data.fmc_continents.n038.id
}
