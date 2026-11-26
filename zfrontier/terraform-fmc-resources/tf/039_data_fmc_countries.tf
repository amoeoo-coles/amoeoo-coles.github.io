# 039 · data source fmc_countries · 2. Objects
# This data source reads the Countries.
# Reads models/data_fmc_countries.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/data_fmc_countries.yml"))["data_fmc_countries"]
}

data "fmc_countries" "n039" {
  domain = local.m_039["domain"]
  items = local.m_039["items"]
}

output "n039_data_fmc_countries_id" {
  value = data.fmc_countries.n039.id
}
