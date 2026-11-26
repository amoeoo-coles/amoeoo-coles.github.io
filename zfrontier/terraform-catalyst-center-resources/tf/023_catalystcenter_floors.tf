# 023 · resource catalystcenter_floors · 2. Sites
# Manages multiple floors within a single resource, specifying a map of floors as input. This resource is designed for bulk operations to efficiently create multiple floors at once. To retrieve existing floors, use the data source catalystcenter_sites with type filter set to 'floor'
# Reads models/catalystcenter_floors.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/catalystcenter_floors.yml"))["catalystcenter_floors"]
}

resource "catalystcenter_floors" "n023" {
  floors = local.m_023["floors"]
  scope  = local.m_023["scope"]
}
