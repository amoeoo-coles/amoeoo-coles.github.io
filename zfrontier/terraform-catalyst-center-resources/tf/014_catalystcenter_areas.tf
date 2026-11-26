# 014 · resource catalystcenter_areas · 2. Sites
# Manages multiple areas within a single resource, specifying a map of areas as input. This resource is designed for bulk operations to efficiently create multiple areas at once. To retrieve existing areas, use the data source catalystcenter_sites with type filter set to 'area'
# Reads models/catalystcenter_areas.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/catalystcenter_areas.yml"))["catalystcenter_areas"]
}

resource "catalystcenter_areas" "n014" {
  areas = local.m_014["areas"]
  scope = local.m_014["scope"]
}
