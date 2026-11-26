# 125 · resource fmc_ipv6_address_pool · 2. Objects
# This resource manages an IPv6 Address Pool.
# Reads models/fmc_ipv6_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_125 = yamldecode(file("${path.module}/../models/fmc_ipv6_address_pool.yml"))["fmc_ipv6_address_pool"]
}

resource "fmc_ipv6_address_pool" "n125" {
  description = local.m_125["description"]
  domain = local.m_125["domain"]
  name = local.m_125["name"]
  number_of_addresses = local.m_125["number_of_addresses"]
  overridable = local.m_125["overridable"]
  start_address = local.m_125["start_address"]
}
