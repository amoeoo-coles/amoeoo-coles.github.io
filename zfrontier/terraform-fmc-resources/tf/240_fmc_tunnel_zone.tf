# 240 · resource fmc_tunnel_zone · 2. Objects
# This resource manages a Tunnel Zone.
# Reads models/fmc_tunnel_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_240 = yamldecode(file("${path.module}/../models/fmc_tunnel_zone.yml"))["fmc_tunnel_zone"]
}

resource "fmc_tunnel_zone" "n240" {
  description = local.m_240["description"]
  domain = local.m_240["domain"]
  name = local.m_240["name"]
}
