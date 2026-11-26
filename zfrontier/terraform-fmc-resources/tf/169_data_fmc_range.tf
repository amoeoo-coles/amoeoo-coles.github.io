# 169 · data source fmc_range · 2. Objects
# This data source reads the Range.
# Reads models/data_fmc_range.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_169 = yamldecode(file("${path.module}/../models/data_fmc_range.yml"))["data_fmc_range"]
}

data "fmc_range" "n169" {
  domain = local.m_169["domain"]
  id = local.m_169["id"]
  name = local.m_169["name"]
}

output "n169_data_fmc_range_id" {
  value = data.fmc_range.n169.id
}
