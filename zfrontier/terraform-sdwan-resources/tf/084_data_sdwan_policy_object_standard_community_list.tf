# 084 · data source sdwan_policy_object_standard_community_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Standard Community List Policy_object.
# Reads models/data_sdwan_policy_object_standard_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_standard_community_list.yml"))["data_sdwan_policy_object_standard_community_list"]
}

data "sdwan_policy_object_standard_community_list" "n084" {
  feature_profile_id = local.m_084["feature_profile_id"]
  id                 = local.m_084["id"]
  name               = local.m_084["name"]
}

output "n084_data_sdwan_policy_object_standard_community_list_id" {
  value = data.sdwan_policy_object_standard_community_list.n084.id
}
