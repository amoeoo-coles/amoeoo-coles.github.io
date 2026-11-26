# 025 · data source sdwan_policy_object_class_map · 3. Policy objects and custom applications
# This data source can read the Policy Object Class Map Policy_object.
# Reads models/data_sdwan_policy_object_class_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_class_map.yml"))["data_sdwan_policy_object_class_map"]
}

data "sdwan_policy_object_class_map" "n025" {
  feature_profile_id = local.m_025["feature_profile_id"]
  id                 = local.m_025["id"]
  name               = local.m_025["name"]
}

output "n025_data_sdwan_policy_object_class_map_id" {
  value = data.sdwan_policy_object_class_map.n025.id
}
