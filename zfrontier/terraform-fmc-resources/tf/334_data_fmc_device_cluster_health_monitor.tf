# 334 · data source fmc_device_cluster_health_monitor · 4. Devices
# This data source reads the Device Cluster Health Monitor.
# Reads models/data_fmc_device_cluster_health_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_334 = yamldecode(file("${path.module}/../models/data_fmc_device_cluster_health_monitor.yml"))["data_fmc_device_cluster_health_monitor"]
}

data "fmc_device_cluster_health_monitor" "n334" {
  cluster_id = local.m_334["cluster_id"]
  domain     = local.m_334["domain"]
  id         = local.m_334["id"]
}

output "n334_data_fmc_device_cluster_health_monitor_id" {
  value = data.fmc_device_cluster_health_monitor.n334.id
}
