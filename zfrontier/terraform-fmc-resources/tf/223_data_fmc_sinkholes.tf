# 223 · data source fmc_sinkholes · 2. Objects
# This data source reads the Sinkholes.
# Reads models/data_fmc_sinkholes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_223 = yamldecode(file("${path.module}/../models/data_fmc_sinkholes.yml"))["data_fmc_sinkholes"]
}

data "fmc_sinkholes" "n223" {
  domain = local.m_223["domain"]
  items = local.m_223["items"]
}

output "n223_data_fmc_sinkholes_id" {
  value = data.fmc_sinkholes.n223.id
}
