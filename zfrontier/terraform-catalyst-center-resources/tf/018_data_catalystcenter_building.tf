# 018 · data source catalystcenter_building · 2. Sites
# This data source can read the Building.
# Reads models/data_catalystcenter_building.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/data_catalystcenter_building.yml"))["data_catalystcenter_building"]
}

data "catalystcenter_building" "n018" {
  id = local.m_018["id"]
}

output "n018_data_catalystcenter_building_id" {
  value = data.catalystcenter_building.n018.id
}
