# 140 · resource fmc_mac_address_pools · 2. Objects
# This resource manages MAC Address Pools through bulk operations. The following restrictions apply: Minimum FMC version: 7.6Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done o
# Reads models/fmc_mac_address_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_140 = yamldecode(file("${path.module}/../models/fmc_mac_address_pools.yml"))["fmc_mac_address_pools"]
}

resource "fmc_mac_address_pools" "n140" {
  domain = local.m_140["domain"]
  items  = local.m_140["items"]
}
