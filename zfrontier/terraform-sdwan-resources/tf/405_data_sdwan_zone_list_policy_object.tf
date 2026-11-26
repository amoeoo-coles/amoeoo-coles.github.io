# 405 · data source sdwan_zone_list_policy_object · 10. (Classic) policy objects
# This data source can read the Zone List Policy Object .
# Reads models/data_sdwan_zone_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_405 = yamldecode(file("${path.module}/../models/data_sdwan_zone_list_policy_object.yml"))["data_sdwan_zone_list_policy_object"]
}

data "sdwan_zone_list_policy_object" "n405" {
  id = local.m_405["id"]
}

output "n405_data_sdwan_zone_list_policy_object_id" {
  value = data.sdwan_zone_list_policy_object.n405.id
}
