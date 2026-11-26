# 389 · data source sdwan_preferred_color_group_policy_object · 10. (Classic) policy objects
# This data source can read the Preferred Color Group Policy Object .
# Reads models/data_sdwan_preferred_color_group_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_389 = yamldecode(file("${path.module}/../models/data_sdwan_preferred_color_group_policy_object.yml"))["data_sdwan_preferred_color_group_policy_object"]
}

data "sdwan_preferred_color_group_policy_object" "n389" {
  id = local.m_389["id"]
}

output "n389_data_sdwan_preferred_color_group_policy_object_id" {
  value = data.sdwan_preferred_color_group_policy_object.n389.id
}
