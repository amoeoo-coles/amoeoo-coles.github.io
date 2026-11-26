# 148 · resource fmc_network_groups · 2. Objects
# This resource manages Network Groups through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one
# Reads models/fmc_network_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_148 = yamldecode(file("${path.module}/../models/fmc_network_groups.yml"))["fmc_network_groups"]
}

resource "fmc_network_groups" "n148" {
  domain = local.m_148["domain"]
  items  = local.m_148["items"]
}
