# 147 · resource sdwan_system_mrf_feature · 5. Features: system
# This resource can manage a System MRF Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_mrf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_147 = yamldecode(file("${path.module}/../models/sdwan_system_mrf_feature.yml"))["sdwan_system_mrf_feature"]
}

resource "sdwan_system_mrf_feature" "n147" {
  description                       = local.m_147["description"]
  enable_management_region          = local.m_147["enable_management_region"]
  enable_management_region_variable = local.m_147["enable_management_region_variable"]
  enable_migration_to_mrf           = local.m_147["enable_migration_to_mrf"]
  feature_profile_id                = local.m_147["feature_profile_id"]
  gateway_preference                = local.m_147["gateway_preference"]
  gateway_preference_variable       = local.m_147["gateway_preference_variable"]
  management_gateway                = local.m_147["management_gateway"]
  management_gateway_variable       = local.m_147["management_gateway_variable"]
  migration_bgp_community           = local.m_147["migration_bgp_community"]
  name                              = local.m_147["name"]
  role                              = local.m_147["role"]
  role_variable                     = local.m_147["role_variable"]
  secondary_region_id               = local.m_147["secondary_region_id"]
  secondary_region_id_variable      = local.m_147["secondary_region_id_variable"]
  vrf_id                            = local.m_147["vrf_id"]
  vrf_id_variable                   = local.m_147["vrf_id_variable"]
}
