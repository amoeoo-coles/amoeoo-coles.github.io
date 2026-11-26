# 019 · resource catalystcenter_buildings · 2. Sites
# Manages multiple buildings within a single resource, specifying a map of buildings as input. This resource is designed for bulk operations to efficiently create multiple buildings at once. To retrieve existing buildings, use the data source catalystcenter_sites with type filter set to 'building'
# Reads models/catalystcenter_buildings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_019 = yamldecode(file("${path.module}/../models/catalystcenter_buildings.yml"))["catalystcenter_buildings"]
}

resource "catalystcenter_buildings" "n019" {
  buildings = local.m_019["buildings"]
  scope     = local.m_019["scope"]
}
