# 027 · data source sdwan_policy_object_color_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Color List Policy_object.
# Reads models/data_sdwan_policy_object_color_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_027 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_color_list.yml"))["data_sdwan_policy_object_color_list"]
}

data "sdwan_policy_object_color_list" "n027" {
  feature_profile_id = local.m_027["feature_profile_id"]
  id                 = local.m_027["id"]
  name               = local.m_027["name"]
}

output "n027_data_sdwan_policy_object_color_list_id" {
  value = data.sdwan_policy_object_color_list.n027.id
}
