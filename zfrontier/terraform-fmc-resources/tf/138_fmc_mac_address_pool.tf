# 138 · resource fmc_mac_address_pool · 2. Objects
# This resource manages a MAC Address Pool. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/fmc_mac_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_138 = yamldecode(file("${path.module}/../models/fmc_mac_address_pool.yml"))["fmc_mac_address_pool"]
}

resource "fmc_mac_address_pool" "n138" {
  description = local.m_138["description"]
  domain = local.m_138["domain"]
  mac_address_range = local.m_138["mac_address_range"]
  name = local.m_138["name"]
  overridable = local.m_138["overridable"]
}
