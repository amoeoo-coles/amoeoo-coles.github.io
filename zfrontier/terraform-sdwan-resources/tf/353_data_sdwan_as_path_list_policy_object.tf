# 353 · data source sdwan_as_path_list_policy_object · 10. (Classic) policy objects
# This data source can read the AS Path List Policy Object .
# Reads models/data_sdwan_as_path_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_353 = yamldecode(file("${path.module}/../models/data_sdwan_as_path_list_policy_object.yml"))["data_sdwan_as_path_list_policy_object"]
}

data "sdwan_as_path_list_policy_object" "n353" {
  id = local.m_353["id"]
}

output "n353_data_sdwan_as_path_list_policy_object_id" {
  value = data.sdwan_as_path_list_policy_object.n353.id
}
