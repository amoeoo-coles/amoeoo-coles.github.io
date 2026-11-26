# 023 · data source sdwan_policy_object_as_path_list · 3. Policy objects and custom applications
# This data source can read the Policy Object AS Path List Policy_object.
# Reads models/data_sdwan_policy_object_as_path_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_as_path_list.yml"))["data_sdwan_policy_object_as_path_list"]
}

data "sdwan_policy_object_as_path_list" "n023" {
  feature_profile_id = local.m_023["feature_profile_id"]
  id = local.m_023["id"]
  name = local.m_023["name"]
}

output "n023_data_sdwan_policy_object_as_path_list_id" {
  value = data.sdwan_policy_object_as_path_list.n023.id
}
