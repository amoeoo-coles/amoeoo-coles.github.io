# 430 · resource sdwan_cisco_logging_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco Logging feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_logging_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_430 = yamldecode(file("${path.module}/../models/sdwan_cisco_logging_feature_template.yml"))["sdwan_cisco_logging_feature_template"]
}

resource "sdwan_cisco_logging_feature_template" "n430" {
  description            = local.m_430["description"]
  device_types           = local.m_430["device_types"]
  disk_logging           = local.m_430["disk_logging"]
  disk_logging_variable  = local.m_430["disk_logging_variable"]
  ipv4_servers           = local.m_430["ipv4_servers"]
  ipv6_servers           = local.m_430["ipv6_servers"]
  log_rotations          = local.m_430["log_rotations"]
  log_rotations_variable = local.m_430["log_rotations_variable"]
  max_size               = local.m_430["max_size"]
  max_size_variable      = local.m_430["max_size_variable"]
  name                   = local.m_430["name"]
  tls_profiles           = local.m_430["tls_profiles"]
}
