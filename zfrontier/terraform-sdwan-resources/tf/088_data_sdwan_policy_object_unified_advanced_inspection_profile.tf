# 088 · data source sdwan_policy_object_unified_advanced_inspection_profile · 3. Policy objects and custom applications
# This data source can read the Policy Object Unified Advanced Inspection Profile Policy_object.
# Reads models/data_sdwan_policy_object_unified_advanced_inspection_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_unified_advanced_inspection_profile.yml"))["data_sdwan_policy_object_unified_advanced_inspection_profile"]
}

data "sdwan_policy_object_unified_advanced_inspection_profile" "n088" {
  feature_profile_id = local.m_088["feature_profile_id"]
  id                 = local.m_088["id"]
  name               = local.m_088["name"]
}

output "n088_data_sdwan_policy_object_unified_advanced_inspection_profile_id" {
  value = data.sdwan_policy_object_unified_advanced_inspection_profile.n088.id
}
