# 235 · data source fmc_time_range · 2. Objects
# This data source reads the Time Range.
# Reads models/data_fmc_time_range.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_235 = yamldecode(file("${path.module}/../models/data_fmc_time_range.yml"))["data_fmc_time_range"]
}

data "fmc_time_range" "n235" {
  domain = local.m_235["domain"]
  id = local.m_235["id"]
  name = local.m_235["name"]
}

output "n235_data_fmc_time_range_id" {
  value = data.fmc_time_range.n235.id
}
