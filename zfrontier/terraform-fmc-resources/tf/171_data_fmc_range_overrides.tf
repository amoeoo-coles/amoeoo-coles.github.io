# 171 · data source fmc_range_overrides · 2. Objects
# This data source reads the Range Overrides.
# Reads models/data_fmc_range_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_171 = yamldecode(file("${path.module}/../models/data_fmc_range_overrides.yml"))["data_fmc_range_overrides"]
}

data "fmc_range_overrides" "n171" {
  domain = local.m_171["domain"]
  id = local.m_171["id"]
  parent_name = local.m_171["parent_name"]
}

output "n171_data_fmc_range_overrides_id" {
  value = data.fmc_range_overrides.n171.id
}
