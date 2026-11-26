# 359 · data source sdwan_color_list_policy_object · 10. (Classic) policy objects
# This data source can read the Color List Policy Object .
# Reads models/data_sdwan_color_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_359 = yamldecode(file("${path.module}/../models/data_sdwan_color_list_policy_object.yml"))["data_sdwan_color_list_policy_object"]
}

data "sdwan_color_list_policy_object" "n359" {
  id = local.m_359["id"]
}

output "n359_data_sdwan_color_list_policy_object_id" {
  value = data.sdwan_color_list_policy_object.n359.id
}
