# 112 · data source mso_service_node_type · 9. Service graphs and devices
# Data Source for MSO Service Node Type.
# Class: not collected · DN: not collected
# Reads models/data_mso_service_node_type.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/data_mso_service_node_type.yml"))["data_mso_service_node_type"]
}

data "mso_service_node_type" "n112" {
  name = local.m_112["name"]
}

output "n112_data_mso_service_node_type_id" {
  value = data.mso_service_node_type.n112.id
}
