# 358 · resource fmc_device_ipv6_static_route · 4. Devices
# This resource manages a Device IPv6 Static Route.
# Reads models/fmc_device_ipv6_static_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_358 = yamldecode(file("${path.module}/../models/fmc_device_ipv6_static_route.yml"))["fmc_device_ipv6_static_route"]
}

resource "fmc_device_ipv6_static_route" "n358" {
  destination_networks   = local.m_358["destination_networks"]
  device_id              = local.m_358["device_id"]
  domain                 = local.m_358["domain"]
  gateway_host_literal   = local.m_358["gateway_host_literal"]
  gateway_host_object_id = local.m_358["gateway_host_object_id"]
  interface_id           = local.m_358["interface_id"]
  interface_logical_name = local.m_358["interface_logical_name"]
  is_tunneled            = local.m_358["is_tunneled"]
  metric                 = local.m_358["metric"]
  vrf_id                 = local.m_358["vrf_id"]
}
