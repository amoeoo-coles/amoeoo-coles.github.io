# 242 · resource fmc_tunnel_zones · 2. Objects
# This resource manages Tunnel Zones through bulk operations. The following restrictions apply: Minimum FMC version for bulk object deletion: 7.4If FMC version does not meet the minimum version requirement for bulk operations, this resource will automatically fall back to processing operations one-b
# Reads models/fmc_tunnel_zones.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_242 = yamldecode(file("${path.module}/../models/fmc_tunnel_zones.yml"))["fmc_tunnel_zones"]
}

resource "fmc_tunnel_zones" "n242" {
  domain = local.m_242["domain"]
  items = local.m_242["items"]
}
