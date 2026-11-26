# 339 · data source fmc_device_dhcp_relay · 4. Devices
# This data source reads the Device DHCP Relay. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_device_dhcp_relay.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_339 = yamldecode(file("${path.module}/../models/data_fmc_device_dhcp_relay.yml"))["data_fmc_device_dhcp_relay"]
}

data "fmc_device_dhcp_relay" "n339" {
  device_id = local.m_339["device_id"]
  domain    = local.m_339["domain"]
  id        = local.m_339["id"]
}

output "n339_data_fmc_device_dhcp_relay_id" {
  value = data.fmc_device_dhcp_relay.n339.id
}
