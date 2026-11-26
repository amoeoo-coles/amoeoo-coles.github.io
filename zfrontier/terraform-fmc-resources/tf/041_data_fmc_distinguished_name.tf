# 041 · data source fmc_distinguished_name · 2. Objects
# This data source reads the Distinguished Name. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_distinguished_name.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/data_fmc_distinguished_name.yml"))["data_fmc_distinguished_name"]
}

data "fmc_distinguished_name" "n041" {
  domain = local.m_041["domain"]
  id = local.m_041["id"]
  name = local.m_041["name"]
}

output "n041_data_fmc_distinguished_name_id" {
  value = data.fmc_distinguished_name.n041.id
}
