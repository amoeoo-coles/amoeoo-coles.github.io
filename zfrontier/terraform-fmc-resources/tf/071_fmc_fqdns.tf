# 071 · resource fmc_fqdns · 2. Objects
# This resource manages a FQDN (Fully Qualified Domain Name) Object through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back
# Reads models/fmc_fqdns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_071 = yamldecode(file("${path.module}/../models/fmc_fqdns.yml"))["fmc_fqdns"]
}

resource "fmc_fqdns" "n071" {
  domain = local.m_071["domain"]
  items = local.m_071["items"]
}
