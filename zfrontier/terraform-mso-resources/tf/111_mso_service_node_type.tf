# 111 · resource mso_service_node_type · 9. Service graphs and devices
# Manages MSO Service Node Type
# Class: not collected · DN: not collected
# Reads models/mso_service_node_type.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/mso_service_node_type.yml"))["mso_service_node_type"]
}

resource "mso_service_node_type" "n111" {
  display_name = local.m_111["display_name"]
  name         = local.m_111["name"]
}
