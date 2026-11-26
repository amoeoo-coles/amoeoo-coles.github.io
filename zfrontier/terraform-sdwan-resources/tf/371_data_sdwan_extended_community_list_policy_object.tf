# 371 · data source sdwan_extended_community_list_policy_object · 10. (Classic) policy objects
# This data source can read the Extended Community List Policy Object .
# Reads models/data_sdwan_extended_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_371 = yamldecode(file("${path.module}/../models/data_sdwan_extended_community_list_policy_object.yml"))["data_sdwan_extended_community_list_policy_object"]
}

data "sdwan_extended_community_list_policy_object" "n371" {
  id = local.m_371["id"]
}

output "n371_data_sdwan_extended_community_list_policy_object_id" {
  value = data.sdwan_extended_community_list_policy_object.n371.id
}
