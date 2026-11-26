# 341 · data source fmc_device_dhcp_server · 4. Devices
# This data source reads the Device DHCP Server. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_device_dhcp_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_341 = yamldecode(file("${path.module}/../models/data_fmc_device_dhcp_server.yml"))["data_fmc_device_dhcp_server"]
}

data "fmc_device_dhcp_server" "n341" {
  device_id = local.m_341["device_id"]
  domain = local.m_341["domain"]
  id = local.m_341["id"]
}

output "n341_data_fmc_device_dhcp_server_id" {
  value = data.fmc_device_dhcp_server.n341.id
}
