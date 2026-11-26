# 350 · resource fmc_device_ha_pair_failover_interface_mac_address · 4. Devices
# This resource manages a Device HA Pair Failover Interface MAC Address.
# Reads models/fmc_device_ha_pair_failover_interface_mac_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_350 = yamldecode(file("${path.module}/../models/fmc_device_ha_pair_failover_interface_mac_address.yml"))["fmc_device_ha_pair_failover_interface_mac_address"]
}

resource "fmc_device_ha_pair_failover_interface_mac_address" "n350" {
  active_mac_address = local.m_350["active_mac_address"]
  domain = local.m_350["domain"]
  ha_pair_id = local.m_350["ha_pair_id"]
  interface_id = local.m_350["interface_id"]
  interface_name = local.m_350["interface_name"]
  interface_type = local.m_350["interface_type"]
  standby_mac_address = local.m_350["standby_mac_address"]
}
