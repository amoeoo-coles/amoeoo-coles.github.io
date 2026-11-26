# 252 · resource fmc_urls · 2. Objects
# This resource manages URLs through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one.Up
# Reads models/fmc_urls.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_252 = yamldecode(file("${path.module}/../models/fmc_urls.yml"))["fmc_urls"]
}

resource "fmc_urls" "n252" {
  domain = local.m_252["domain"]
  items  = local.m_252["items"]
}
