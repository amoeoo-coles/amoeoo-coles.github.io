# 046 · data source sdwan_policy_object_preferred_color_group · 3. Policy objects and custom applications
# This data source can read the Policy Object Preferred Color Group Policy_object.
# Reads models/data_sdwan_policy_object_preferred_color_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_preferred_color_group.yml"))["data_sdwan_policy_object_preferred_color_group"]
}

data "sdwan_policy_object_preferred_color_group" "n046" {
  feature_profile_id = local.m_046["feature_profile_id"]
  id = local.m_046["id"]
  name = local.m_046["name"]
}

output "n046_data_sdwan_policy_object_preferred_color_group_id" {
  value = data.sdwan_policy_object_preferred_color_group.n046.id
}
