# 360 · resource fmc_device_loopback_interface · 4. Devices
# This resource manages a Device Loopback Interface. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_device_loopback_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_360 = yamldecode(file("${path.module}/../models/fmc_device_loopback_interface.yml"))["fmc_device_loopback_interface"]
}

resource "fmc_device_loopback_interface" "n360" {
  description = local.m_360["description"]
  device_id = local.m_360["device_id"]
  domain = local.m_360["domain"]
  enabled = local.m_360["enabled"]
  ipv4_static_address = local.m_360["ipv4_static_address"]
  ipv4_static_netmask = local.m_360["ipv4_static_netmask"]
  ipv6_addresses = local.m_360["ipv6_addresses"]
  logical_name = local.m_360["logical_name"]
  loopback_id = local.m_360["loopback_id"]
}
