# 026 · data source catalystcenter_planned_access_point_position · 2. Sites
# This data source reads a planned Access Point position from a floor map in Cisco Catalyst Center.
# Reads models/data_catalystcenter_planned_access_point_position.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/data_catalystcenter_planned_access_point_position.yml"))["data_catalystcenter_planned_access_point_position"]
}

data "catalystcenter_planned_access_point_position" "n026" {
  floor_id = local.m_026["floor_id"]
  name     = local.m_026["name"]
}

output "n026_data_catalystcenter_planned_access_point_position_id" {
  value = data.catalystcenter_planned_access_point_position.n026.id
}
