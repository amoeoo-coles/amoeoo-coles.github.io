# 446 · resource sdwan_cisco_snmp_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco SNMP feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_snmp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_446 = yamldecode(file("${path.module}/../models/sdwan_cisco_snmp_feature_template.yml"))["sdwan_cisco_snmp_feature_template"]
}

resource "sdwan_cisco_snmp_feature_template" "n446" {
  communities = local.m_446["communities"]
  contact = local.m_446["contact"]
  contact_variable = local.m_446["contact_variable"]
  description = local.m_446["description"]
  device_types = local.m_446["device_types"]
  groups = local.m_446["groups"]
  location = local.m_446["location"]
  location_variable = local.m_446["location_variable"]
  name = local.m_446["name"]
  shutdown = local.m_446["shutdown"]
  shutdown_variable = local.m_446["shutdown_variable"]
  trap_targets = local.m_446["trap_targets"]
  users = local.m_446["users"]
  views = local.m_446["views"]
}
