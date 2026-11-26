# 087 · resource fmc_icmpv4s · 2. Objects
# This resource manages ICMPv4s through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one
# Reads models/fmc_icmpv4s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/fmc_icmpv4s.yml"))["fmc_icmpv4s"]
}

resource "fmc_icmpv4s" "n087" {
  domain = local.m_087["domain"]
  items  = local.m_087["items"]
}
