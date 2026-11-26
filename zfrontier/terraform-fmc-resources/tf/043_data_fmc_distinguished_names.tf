# 043 · data source fmc_distinguished_names · 2. Objects
# This data source reads the Distinguished Names. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_distinguished_names.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/data_fmc_distinguished_names.yml"))["data_fmc_distinguished_names"]
}

data "fmc_distinguished_names" "n043" {
  domain = local.m_043["domain"]
  items  = local.m_043["items"]
}

output "n043_data_fmc_distinguished_names_id" {
  value = data.fmc_distinguished_names.n043.id
}
