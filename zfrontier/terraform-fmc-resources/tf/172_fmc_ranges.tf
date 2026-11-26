# 172 · resource fmc_ranges · 2. Objects
# This resource manages Ranges through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one.
# Reads models/fmc_ranges.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_172 = yamldecode(file("${path.module}/../models/fmc_ranges.yml"))["fmc_ranges"]
}

resource "fmc_ranges" "n172" {
  domain = local.m_172["domain"]
  items = local.m_172["items"]
}
