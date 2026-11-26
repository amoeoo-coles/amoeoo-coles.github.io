# 129 · resource sdwan_system_banner_feature · 5. Features: system
# This resource can manage a System Banner Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_banner_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_129 = yamldecode(file("${path.module}/../models/sdwan_system_banner_feature.yml"))["sdwan_system_banner_feature"]
}

resource "sdwan_system_banner_feature" "n129" {
  description = local.m_129["description"]
  feature_profile_id = local.m_129["feature_profile_id"]
  login = local.m_129["login"]
  login_variable = local.m_129["login_variable"]
  motd = local.m_129["motd"]
  motd_variable = local.m_129["motd_variable"]
  name = local.m_129["name"]
}
