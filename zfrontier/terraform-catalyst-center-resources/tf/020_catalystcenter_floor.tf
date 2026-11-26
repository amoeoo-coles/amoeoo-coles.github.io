# 020 · resource catalystcenter_floor · 2. Sites
# This resource can manage a Floor.
# Reads models/catalystcenter_floor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_020 = yamldecode(file("${path.module}/../models/catalystcenter_floor.yml"))["catalystcenter_floor"]
}

resource "catalystcenter_floor" "n020" {
  floor_number     = local.m_020["floor_number"]
  height           = local.m_020["height"]
  length           = local.m_020["length"]
  name             = local.m_020["name"]
  parent_id        = local.m_020["parent_id"]
  rf_model         = local.m_020["rf_model"]
  units_of_measure = local.m_020["units_of_measure"]
  width            = local.m_020["width"]
}
