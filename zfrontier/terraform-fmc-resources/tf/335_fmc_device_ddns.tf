# 335 · resource fmc_device_ddns · 4. Devices
# This resource manages a Device DDNS. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_device_ddns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_335 = yamldecode(file("${path.module}/../models/fmc_device_ddns.yml"))["fmc_device_ddns"]
}

resource "fmc_device_ddns" "n335" {
  ddns_interface_settings = local.m_335["ddns_interface_settings"]
  ddns_update_methods = local.m_335["ddns_update_methods"]
  device_id = local.m_335["device_id"]
  dhcp_client_broadcast = local.m_335["dhcp_client_broadcast"]
  dhcp_client_id_interfaces = local.m_335["dhcp_client_id_interfaces"]
  dhcp_client_request_override = local.m_335["dhcp_client_request_override"]
  dhcp_client_request_type = local.m_335["dhcp_client_request_type"]
  domain = local.m_335["domain"]
  dynamic_dns_update = local.m_335["dynamic_dns_update"]
}
