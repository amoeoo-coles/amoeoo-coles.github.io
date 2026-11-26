# 243 · data source fmc_tunnel_zones · 2. Objects
# This data source reads the Tunnel Zones.
# Reads models/data_fmc_tunnel_zones.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_243 = yamldecode(file("${path.module}/../models/data_fmc_tunnel_zones.yml"))["data_fmc_tunnel_zones"]
}

data "fmc_tunnel_zones" "n243" {
  domain = local.m_243["domain"]
  items  = local.m_243["items"]
}

output "n243_data_fmc_tunnel_zones_id" {
  value = data.fmc_tunnel_zones.n243.id
}
