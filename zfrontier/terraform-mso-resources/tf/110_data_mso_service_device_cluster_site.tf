# 110 · data source mso_service_device_cluster_site · 9. Service graphs and devices
# Data source for the site-specific configuration of a Service Device Cluster.
# Class: not collected · DN: not collected
# Reads models/data_mso_service_device_cluster_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/data_mso_service_device_cluster_site.yml"))["data_mso_service_device_cluster_site"]
}

data "mso_service_device_cluster_site" "n110" {
  name        = local.m_110["name"]
  site_id     = local.m_110["site_id"]
  template_id = local.m_110["template_id"]
}

output "n110_data_mso_service_device_cluster_site_id" {
  value = data.mso_service_device_cluster_site.n110.id
}
