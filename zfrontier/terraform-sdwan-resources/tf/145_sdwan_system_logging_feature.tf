# 145 · resource sdwan_system_logging_feature · 5. Features: system
# This resource can manage a System Logging Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_logging_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_145 = yamldecode(file("${path.module}/../models/sdwan_system_logging_feature.yml"))["sdwan_system_logging_feature"]
}

resource "sdwan_system_logging_feature" "n145" {
  description               = local.m_145["description"]
  disk_enable               = local.m_145["disk_enable"]
  disk_enable_variable      = local.m_145["disk_enable_variable"]
  disk_file_rotate          = local.m_145["disk_file_rotate"]
  disk_file_rotate_variable = local.m_145["disk_file_rotate_variable"]
  disk_file_size            = local.m_145["disk_file_size"]
  disk_file_size_variable   = local.m_145["disk_file_size_variable"]
  feature_profile_id        = local.m_145["feature_profile_id"]
  ipv4_servers              = local.m_145["ipv4_servers"]
  ipv6_servers              = local.m_145["ipv6_servers"]
  name                      = local.m_145["name"]
  tls_profiles              = local.m_145["tls_profiles"]
}
