# 351 · data source fmc_device_ha_pair_failover_interface_mac_address · 4. Devices
# This data source reads the Device HA Pair Failover Interface MAC Address.
# Reads models/data_fmc_device_ha_pair_failover_interface_mac_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_351 = yamldecode(file("${path.module}/../models/data_fmc_device_ha_pair_failover_interface_mac_address.yml"))["data_fmc_device_ha_pair_failover_interface_mac_address"]
}

data "fmc_device_ha_pair_failover_interface_mac_address" "n351" {
  domain = local.m_351["domain"]
  ha_pair_id = local.m_351["ha_pair_id"]
  id = local.m_351["id"]
  interface_name = local.m_351["interface_name"]
}

output "n351_data_fmc_device_ha_pair_failover_interface_mac_address_id" {
  value = data.fmc_device_ha_pair_failover_interface_mac_address.n351.id
}
