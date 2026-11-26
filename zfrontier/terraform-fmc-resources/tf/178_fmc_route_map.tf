# 178 · resource fmc_route_map · 2. Objects
# This resource manages a Route Map.
# Reads models/fmc_route_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_178 = yamldecode(file("${path.module}/../models/fmc_route_map.yml"))["fmc_route_map"]
}

resource "fmc_route_map" "n178" {
  domain = local.m_178["domain"]
  entries = local.m_178["entries"]
  name = local.m_178["name"]
  overridable = local.m_178["overridable"]
}
