# 086 · data source sdwan_policy_object_tloc_list · 3. Policy objects and custom applications
# This data source can read the Policy Object TLOC List Policy_object.
# Reads models/data_sdwan_policy_object_tloc_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_tloc_list.yml"))["data_sdwan_policy_object_tloc_list"]
}

data "sdwan_policy_object_tloc_list" "n086" {
  feature_profile_id = local.m_086["feature_profile_id"]
  id                 = local.m_086["id"]
  name               = local.m_086["name"]
}

output "n086_data_sdwan_policy_object_tloc_list_id" {
  value = data.sdwan_policy_object_tloc_list.n086.id
}
