# 025 · resource catalystcenter_planned_access_point_position · 2. Sites
# This resource manages a planned (virtual) Access Point position on a floor map for RF planning in Cisco Catalyst Center. Planned APs are Day 0 design-time resources - no physical APs are needed in the inventory.
# Reads models/catalystcenter_planned_access_point_position.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/catalystcenter_planned_access_point_position.yml"))["catalystcenter_planned_access_point_position"]
}

resource "catalystcenter_planned_access_point_position" "n025" {
  ap_type     = local.m_025["ap_type"]
  floor_id    = local.m_025["floor_id"]
  mac_address = local.m_025["mac_address"]
  name        = local.m_025["name"]
  position_x  = local.m_025["position_x"]
  position_y  = local.m_025["position_y"]
  position_z  = local.m_025["position_z"]
  radios      = local.m_025["radios"]
}
