# 352 · resource fmc_device_ha_pair_monitoring · 4. Devices
# This resource manages a Device HA Pair Monitoring.
# Reads models/fmc_device_ha_pair_monitoring.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_352 = yamldecode(file("${path.module}/../models/fmc_device_ha_pair_monitoring.yml"))["fmc_device_ha_pair_monitoring"]
}

resource "fmc_device_ha_pair_monitoring" "n352" {
  domain = local.m_352["domain"]
  ha_pair_id = local.m_352["ha_pair_id"]
  ipv4_standby_address = local.m_352["ipv4_standby_address"]
  ipv6_addresses = local.m_352["ipv6_addresses"]
  logical_name = local.m_352["logical_name"]
  monitor_interface = local.m_352["monitor_interface"]
}
