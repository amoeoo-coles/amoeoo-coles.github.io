# 108 · data source mso_service_device_cluster · 9. Service graphs and devices
# Data source for Service Device Cluster.
# Class: not collected · DN: not collected
# Reads models/data_mso_service_device_cluster.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_108 = yamldecode(file("${path.module}/../models/data_mso_service_device_cluster.yml"))["data_mso_service_device_cluster"]
}

data "mso_service_device_cluster" "n108" {
  name        = local.m_108["name"]
  template_id = local.m_108["template_id"]
}

output "n108_data_mso_service_device_cluster_id" {
  value = data.mso_service_device_cluster.n108.id
}
