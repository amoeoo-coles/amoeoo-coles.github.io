# 021 · data source sdwan_policy_object_application_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Application List Policy_object.
# Reads models/data_sdwan_policy_object_application_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_application_list.yml"))["data_sdwan_policy_object_application_list"]
}

data "sdwan_policy_object_application_list" "n021" {
  feature_profile_id = local.m_021["feature_profile_id"]
  id = local.m_021["id"]
  name = local.m_021["name"]
}

output "n021_data_sdwan_policy_object_application_list_id" {
  value = data.sdwan_policy_object_application_list.n021.id
}
