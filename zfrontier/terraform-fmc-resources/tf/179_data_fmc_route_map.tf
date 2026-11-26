# 179 · data source fmc_route_map · 2. Objects
# This data source reads the Route Map.
# Reads models/data_fmc_route_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_179 = yamldecode(file("${path.module}/../models/data_fmc_route_map.yml"))["data_fmc_route_map"]
}

data "fmc_route_map" "n179" {
  domain = local.m_179["domain"]
  id     = local.m_179["id"]
  name   = local.m_179["name"]
}

output "n179_data_fmc_route_map_id" {
  value = data.fmc_route_map.n179.id
}
