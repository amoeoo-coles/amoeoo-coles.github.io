# 173 · data source fmc_ranges · 2. Objects
# This data source reads the Ranges.
# Reads models/data_fmc_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_173 = yamldecode(file("${path.module}/../models/data_fmc_ranges.yml"))["data_fmc_ranges"]
}

data "fmc_ranges" "n173" {
  domain = local.m_173["domain"]
  items  = local.m_173["items"]
}

output "n173_data_fmc_ranges_id" {
  value = data.fmc_ranges.n173.id
}
