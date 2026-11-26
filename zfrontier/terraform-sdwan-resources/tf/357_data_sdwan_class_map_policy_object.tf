# 357 · data source sdwan_class_map_policy_object · 10. (Classic) policy objects
# This data source can read the Class Map Policy Object .
# Reads models/data_sdwan_class_map_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_357 = yamldecode(file("${path.module}/../models/data_sdwan_class_map_policy_object.yml"))["data_sdwan_class_map_policy_object"]
}

data "sdwan_class_map_policy_object" "n357" {
  id = local.m_357["id"]
}

output "n357_data_sdwan_class_map_policy_object_id" {
  value = data.sdwan_class_map_policy_object.n357.id
}
