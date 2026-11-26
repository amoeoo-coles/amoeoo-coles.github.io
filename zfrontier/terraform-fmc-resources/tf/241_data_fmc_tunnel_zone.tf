# 241 · data source fmc_tunnel_zone · 2. Objects
# This data source reads the Tunnel Zone.
# Reads models/data_fmc_tunnel_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_241 = yamldecode(file("${path.module}/../models/data_fmc_tunnel_zone.yml"))["data_fmc_tunnel_zone"]
}

data "fmc_tunnel_zone" "n241" {
  domain = local.m_241["domain"]
  id = local.m_241["id"]
  name = local.m_241["name"]
}

output "n241_data_fmc_tunnel_zone_id" {
  value = data.fmc_tunnel_zone.n241.id
}
