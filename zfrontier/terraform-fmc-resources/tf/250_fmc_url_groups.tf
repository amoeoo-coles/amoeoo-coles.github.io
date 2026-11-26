# 250 · resource fmc_url_groups · 2. Objects
# This resource manages URL Groups through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-
# Reads models/fmc_url_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_250 = yamldecode(file("${path.module}/../models/fmc_url_groups.yml"))["fmc_url_groups"]
}

resource "fmc_url_groups" "n250" {
  domain = local.m_250["domain"]
  items  = local.m_250["items"]
}
