# 017 · resource catalystcenter_building · 2. Sites
# This resource can manage a Building.
# Reads models/catalystcenter_building.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/catalystcenter_building.yml"))["catalystcenter_building"]
}

resource "catalystcenter_building" "n017" {
  address   = local.m_017["address"]
  country   = local.m_017["country"]
  latitude  = local.m_017["latitude"]
  longitude = local.m_017["longitude"]
  name      = local.m_017["name"]
  parent_id = local.m_017["parent_id"]
}
