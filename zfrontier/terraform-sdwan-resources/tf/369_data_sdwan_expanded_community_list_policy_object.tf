# 369 · data source sdwan_expanded_community_list_policy_object · 10. (Classic) policy objects
# This data source can read the Expanded Community List Policy Object .
# Reads models/data_sdwan_expanded_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_369 = yamldecode(file("${path.module}/../models/data_sdwan_expanded_community_list_policy_object.yml"))["data_sdwan_expanded_community_list_policy_object"]
}

data "sdwan_expanded_community_list_policy_object" "n369" {
  id = local.m_369["id"]
}

output "n369_data_sdwan_expanded_community_list_policy_object_id" {
  value = data.sdwan_expanded_community_list_policy_object.n369.id
}
