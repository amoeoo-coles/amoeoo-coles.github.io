# 117 · resource fmc_ipv4_address_pool · 2. Objects
# This resource manages an IPv4 Address Pool.
# Reads models/fmc_ipv4_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_117 = yamldecode(file("${path.module}/../models/fmc_ipv4_address_pool.yml"))["fmc_ipv4_address_pool"]
}

resource "fmc_ipv4_address_pool" "n117" {
  description = local.m_117["description"]
  domain = local.m_117["domain"]
  name = local.m_117["name"]
  netmask = local.m_117["netmask"]
  overridable = local.m_117["overridable"]
  range = local.m_117["range"]
}
