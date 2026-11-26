# 414 · resource fmc_ftd_platform_settings_trusted_dns_servers · 4. Devices
# This resource manages FTD Platform Settings - DNS - Trusted DNS Servers. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_trusted_dns_servers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_414 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_trusted_dns_servers.yml"))["fmc_ftd_platform_settings_trusted_dns_servers"]
}

resource "fmc_ftd_platform_settings_trusted_dns_servers" "n414" {
  domain = local.m_414["domain"]
  ftd_platform_settings_id = local.m_414["ftd_platform_settings_id"]
  trust_any_dns_server = local.m_414["trust_any_dns_server"]
  trust_dhcp_client = local.m_414["trust_dhcp_client"]
  trust_dhcp_pool = local.m_414["trust_dhcp_pool"]
  trust_dhcp_relay = local.m_414["trust_dhcp_relay"]
  trust_dns_server_group = local.m_414["trust_dns_server_group"]
  trusted_dns_servers_literals = local.m_414["trusted_dns_servers_literals"]
  trusted_dns_servers_objects = local.m_414["trusted_dns_servers_objects"]
}
