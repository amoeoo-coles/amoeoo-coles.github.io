# 137 · resource sdwan_system_flexible_port_speed_feature · 5. Features: system
# This resource can manage a System Flexible Port Speed Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_flexible_port_speed_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_137 = yamldecode(file("${path.module}/../models/sdwan_system_flexible_port_speed_feature.yml"))["sdwan_system_flexible_port_speed_feature"]
}

resource "sdwan_system_flexible_port_speed_feature" "n137" {
  description        = local.m_137["description"]
  feature_profile_id = local.m_137["feature_profile_id"]
  name               = local.m_137["name"]
  port_type          = local.m_137["port_type"]
  port_type_variable = local.m_137["port_type_variable"]
}
