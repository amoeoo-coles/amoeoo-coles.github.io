# 373 · data source sdwan_geo_location_list_policy_object · 10. (Classic) policy objects
# This data source can read the Geo Location List Policy Object .
# Reads models/data_sdwan_geo_location_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_373 = yamldecode(file("${path.module}/../models/data_sdwan_geo_location_list_policy_object.yml"))["data_sdwan_geo_location_list_policy_object"]
}

data "sdwan_geo_location_list_policy_object" "n373" {
  id = local.m_373["id"]
}

output "n373_data_sdwan_geo_location_list_policy_object_id" {
  value = data.sdwan_geo_location_list_policy_object.n373.id
}
