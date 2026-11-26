# 013 · data source catalystcenter_area · 2. Sites
# This data source can read the Area.
# Reads models/data_catalystcenter_area.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/data_catalystcenter_area.yml"))["data_catalystcenter_area"]
}

data "catalystcenter_area" "n013" {
  id = local.m_013["id"]
}

output "n013_data_catalystcenter_area_id" {
  value = data.catalystcenter_area.n013.id
}
