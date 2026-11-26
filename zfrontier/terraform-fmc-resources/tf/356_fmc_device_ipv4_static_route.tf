# 356 · resource fmc_device_ipv4_static_route · 4. Devices
# This resource manages a Device IPv4 Static Route.
# Reads models/fmc_device_ipv4_static_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_356 = yamldecode(file("${path.module}/../models/fmc_device_ipv4_static_route.yml"))["fmc_device_ipv4_static_route"]
}

resource "fmc_device_ipv4_static_route" "n356" {
  destination_networks   = local.m_356["destination_networks"]
  device_id              = local.m_356["device_id"]
  domain                 = local.m_356["domain"]
  gateway_host_literal   = local.m_356["gateway_host_literal"]
  gateway_host_object_id = local.m_356["gateway_host_object_id"]
  interface_id           = local.m_356["interface_id"]
  interface_logical_name = local.m_356["interface_logical_name"]
  is_tunneled            = local.m_356["is_tunneled"]
  metric                 = local.m_356["metric"]
  sla_monitor_id         = local.m_356["sla_monitor_id"]
  vrf_id                 = local.m_356["vrf_id"]
}
