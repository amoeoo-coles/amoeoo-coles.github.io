# 119 · resource fmc_ipv4_address_pools · 2. Objects
# This resource manages IPv4 Address Pools through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ipv4_address_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_119 = yamldecode(file("${path.module}/../models/fmc_ipv4_address_pools.yml"))["fmc_ipv4_address_pools"]
}

resource "fmc_ipv4_address_pools" "n119" {
  domain = local.m_119["domain"]
  items = local.m_119["items"]
}
