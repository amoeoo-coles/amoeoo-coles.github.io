# 170 · resource fmc_range_overrides · 2. Objects
# This resource manages a Range Overrides.
# Reads models/fmc_range_overrides.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_170 = yamldecode(file("${path.module}/../models/fmc_range_overrides.yml"))["fmc_range_overrides"]
}

resource "fmc_range_overrides" "n170" {
  domain      = local.m_170["domain"]
  overrides   = local.m_170["overrides"]
  parent_id   = local.m_170["parent_id"]
  parent_name = local.m_170["parent_name"]
}
