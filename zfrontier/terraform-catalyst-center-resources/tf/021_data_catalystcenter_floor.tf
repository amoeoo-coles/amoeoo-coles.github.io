# 021 · data source catalystcenter_floor · 2. Sites
# This data source can read the Floor.
# Reads models/data_catalystcenter_floor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/data_catalystcenter_floor.yml"))["data_catalystcenter_floor"]
}

data "catalystcenter_floor" "n021" {
  id = local.m_021["id"]
  units_of_measure = local.m_021["units_of_measure"]
}

output "n021_data_catalystcenter_floor_id" {
  value = data.catalystcenter_floor.n021.id
}
