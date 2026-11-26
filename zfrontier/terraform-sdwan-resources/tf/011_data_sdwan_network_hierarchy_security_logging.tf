# 011 · data source sdwan_network_hierarchy_security_logging · 2. Network hierarchy and inventory
# This data source can read Network Hierarchy Security Logging settings.
# Reads models/data_sdwan_network_hierarchy_security_logging.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/data_sdwan_network_hierarchy_security_logging.yml"))["data_sdwan_network_hierarchy_security_logging"]
}

data "sdwan_network_hierarchy_security_logging" "n011" {
  id = local.m_011["id"]
}

output "n011_data_sdwan_network_hierarchy_security_logging_id" {
  value = data.sdwan_network_hierarchy_security_logging.n011.id
}
