# 001 · data source fmc_domains · 1. System information and licences
# This data source reads the Domains.
# Reads models/data_fmc_domains.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/data_fmc_domains.yml"))["data_fmc_domains"]
}

data "fmc_domains" "n001" {
  items = local.m_001["items"]
}

output "n001_data_fmc_domains_id" {
  value = data.fmc_domains.n001.id
}
