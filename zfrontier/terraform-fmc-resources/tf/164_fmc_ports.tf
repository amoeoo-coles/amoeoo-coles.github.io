# 164 · resource fmc_ports · 2. Objects
# This resource manages Ports through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one.U
# Reads models/fmc_ports.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_164 = yamldecode(file("${path.module}/../models/fmc_ports.yml"))["fmc_ports"]
}

resource "fmc_ports" "n164" {
  domain = local.m_164["domain"]
  items  = local.m_164["items"]
}
