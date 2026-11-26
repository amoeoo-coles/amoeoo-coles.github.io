# 083 · resource fmc_hosts · 2. Objects
# This resource manages Hosts through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one.U
# Reads models/fmc_hosts.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/fmc_hosts.yml"))["fmc_hosts"]
}

resource "fmc_hosts" "n083" {
  domain = local.m_083["domain"]
  items  = local.m_083["items"]
}
