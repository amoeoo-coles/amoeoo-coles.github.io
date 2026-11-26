# 152 · resource fmc_networks · 2. Objects
# This resource manages Networks through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-on
# Reads models/fmc_networks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_152 = yamldecode(file("${path.module}/../models/fmc_networks.yml"))["fmc_networks"]
}

resource "fmc_networks" "n152" {
  domain = local.m_152["domain"]
  items  = local.m_152["items"]
}
