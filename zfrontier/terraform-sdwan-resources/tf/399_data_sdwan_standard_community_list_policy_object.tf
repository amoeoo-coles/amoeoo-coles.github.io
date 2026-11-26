# 399 · data source sdwan_standard_community_list_policy_object · 10. (Classic) policy objects
# This data source can read the Standard Community List Policy Object .
# Reads models/data_sdwan_standard_community_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_399 = yamldecode(file("${path.module}/../models/data_sdwan_standard_community_list_policy_object.yml"))["data_sdwan_standard_community_list_policy_object"]
}

data "sdwan_standard_community_list_policy_object" "n399" {
  id = local.m_399["id"]
}

output "n399_data_sdwan_standard_community_list_policy_object_id" {
  value = data.sdwan_standard_community_list_policy_object.n399.id
}
