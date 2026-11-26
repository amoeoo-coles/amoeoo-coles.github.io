# 237 · data source fmc_time_ranges · 2. Objects
# This data source reads the Time Ranges.
# Reads models/data_fmc_time_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_237 = yamldecode(file("${path.module}/../models/data_fmc_time_ranges.yml"))["data_fmc_time_ranges"]
}

data "fmc_time_ranges" "n237" {
  domain = local.m_237["domain"]
  items  = local.m_237["items"]
}

output "n237_data_fmc_time_ranges_id" {
  value = data.fmc_time_ranges.n237.id
}
