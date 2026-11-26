# 340 · resource fmc_device_dhcp_server · 4. Devices
# This resource manages a Device DHCP Server. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_device_dhcp_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_340 = yamldecode(file("${path.module}/../models/fmc_device_dhcp_server.yml"))["fmc_device_dhcp_server"]
}

resource "fmc_device_dhcp_server" "n340" {
  auto_config_interface_id = local.m_340["auto_config_interface_id"]
  auto_config_interface_name = local.m_340["auto_config_interface_name"]
  auto_config_interface_type = local.m_340["auto_config_interface_type"]
  device_id = local.m_340["device_id"]
  dhcp_options = local.m_340["dhcp_options"]
  domain = local.m_340["domain"]
  domain_name = local.m_340["domain_name"]
  lease_length = local.m_340["lease_length"]
  ping_timeout = local.m_340["ping_timeout"]
  primary_dns_server_id = local.m_340["primary_dns_server_id"]
  primary_wins_server_id = local.m_340["primary_wins_server_id"]
  secondary_dns_server_id = local.m_340["secondary_dns_server_id"]
  secondary_wins_server_id = local.m_340["secondary_wins_server_id"]
  servers = local.m_340["servers"]
}
