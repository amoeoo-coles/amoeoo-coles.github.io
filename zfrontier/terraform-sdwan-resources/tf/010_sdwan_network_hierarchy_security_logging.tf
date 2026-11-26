# 010 · resource sdwan_network_hierarchy_security_logging · 2. Network hierarchy and inventory
# This resource can manage Network Hierarchy Security Logging settings.
# Reads models/sdwan_network_hierarchy_security_logging.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/sdwan_network_hierarchy_security_logging.yml"))["sdwan_network_hierarchy_security_logging"]
}

resource "sdwan_network_hierarchy_security_logging" "n010" {
  high_speed_logging = local.m_010["high_speed_logging"]
  utd_syslog         = local.m_010["utd_syslog"]
}
