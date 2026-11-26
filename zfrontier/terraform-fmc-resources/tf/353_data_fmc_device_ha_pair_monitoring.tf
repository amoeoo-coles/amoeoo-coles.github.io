# 353 · data source fmc_device_ha_pair_monitoring · 4. Devices
# This data source reads the Device HA Pair Monitoring.
# Reads models/data_fmc_device_ha_pair_monitoring.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_353 = yamldecode(file("${path.module}/../models/data_fmc_device_ha_pair_monitoring.yml"))["data_fmc_device_ha_pair_monitoring"]
}

data "fmc_device_ha_pair_monitoring" "n353" {
  domain       = local.m_353["domain"]
  ha_pair_id   = local.m_353["ha_pair_id"]
  id           = local.m_353["id"]
  logical_name = local.m_353["logical_name"]
}

output "n353_data_fmc_device_ha_pair_monitoring_id" {
  value = data.fmc_device_ha_pair_monitoring.n353.id
}
