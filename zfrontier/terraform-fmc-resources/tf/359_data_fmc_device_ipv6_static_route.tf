# 359 · data source fmc_device_ipv6_static_route · 4. Devices
# This data source reads the Device IPv6 Static Route.
# Reads models/data_fmc_device_ipv6_static_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_359 = yamldecode(file("${path.module}/../models/data_fmc_device_ipv6_static_route.yml"))["data_fmc_device_ipv6_static_route"]
}

data "fmc_device_ipv6_static_route" "n359" {
  device_id = local.m_359["device_id"]
  domain = local.m_359["domain"]
  id = local.m_359["id"]
  vrf_id = local.m_359["vrf_id"]
}

output "n359_data_fmc_device_ipv6_static_route_id" {
  value = data.fmc_device_ipv6_static_route.n359.id
}
