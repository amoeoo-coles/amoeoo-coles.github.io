# 035 · data source sdwan_policy_object_extended_community_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Extended Community List Policy_object.
# Reads models/data_sdwan_policy_object_extended_community_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_extended_community_list.yml"))["data_sdwan_policy_object_extended_community_list"]
}

data "sdwan_policy_object_extended_community_list" "n035" {
  feature_profile_id = local.m_035["feature_profile_id"]
  id = local.m_035["id"]
  name = local.m_035["name"]
}

output "n035_data_sdwan_policy_object_extended_community_list_id" {
  value = data.sdwan_policy_object_extended_community_list.n035.id
}
