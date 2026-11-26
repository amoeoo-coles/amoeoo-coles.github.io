# 332 · data source fmc_device_cluster · 4. Devices
# This data source reads the Device Cluster.
# Reads models/data_fmc_device_cluster.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_332 = yamldecode(file("${path.module}/../models/data_fmc_device_cluster.yml"))["data_fmc_device_cluster"]
}

data "fmc_device_cluster" "n332" {
  domain = local.m_332["domain"]
  id     = local.m_332["id"]
  name   = local.m_332["name"]
}

output "n332_data_fmc_device_cluster_id" {
  value = data.fmc_device_cluster.n332.id
}
