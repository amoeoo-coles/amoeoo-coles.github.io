# 091 · resource fmc_icmpv6s · 2. Objects
# This resource manages ICMPv6s through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-by-one
# Reads models/fmc_icmpv6s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/fmc_icmpv6s.yml"))["fmc_icmpv6s"]
}

resource "fmc_icmpv6s" "n091" {
  domain = local.m_091["domain"]
  items  = local.m_091["items"]
}
