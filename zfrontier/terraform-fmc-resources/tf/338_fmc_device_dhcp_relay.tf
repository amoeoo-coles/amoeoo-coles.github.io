# 338 · resource fmc_device_dhcp_relay · 4. Devices
# This resource manages a Device DHCP Relay. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_device_dhcp_relay.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_338 = yamldecode(file("${path.module}/../models/fmc_device_dhcp_relay.yml"))["fmc_device_dhcp_relay"]
}

resource "fmc_device_dhcp_relay" "n338" {
  device_id = local.m_338["device_id"]
  domain = local.m_338["domain"]
  ipv4_relay_timeout = local.m_338["ipv4_relay_timeout"]
  ipv6_relay_timeout = local.m_338["ipv6_relay_timeout"]
  relay_agents = local.m_338["relay_agents"]
  servers = local.m_338["servers"]
  trust_all_information = local.m_338["trust_all_information"]
}
