# 159 · resource sdwan_system_snmp_feature · 5. Features: system
# This resource can manage a System SNMP Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_snmp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_159 = yamldecode(file("${path.module}/../models/sdwan_system_snmp_feature.yml"))["sdwan_system_snmp_feature"]
}

resource "sdwan_system_snmp_feature" "n159" {
  communities = local.m_159["communities"]
  contact_person = local.m_159["contact_person"]
  contact_person_variable = local.m_159["contact_person_variable"]
  description = local.m_159["description"]
  feature_profile_id = local.m_159["feature_profile_id"]
  groups = local.m_159["groups"]
  location_of_device = local.m_159["location_of_device"]
  location_of_device_variable = local.m_159["location_of_device_variable"]
  name = local.m_159["name"]
  shutdown = local.m_159["shutdown"]
  shutdown_variable = local.m_159["shutdown_variable"]
  trap_target_servers = local.m_159["trap_target_servers"]
  users = local.m_159["users"]
  views = local.m_159["views"]
}
