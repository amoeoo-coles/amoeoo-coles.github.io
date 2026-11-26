# 381 · data source sdwan_local_application_list_policy_object · 10. (Classic) policy objects
# This data source can read the Local Application List Policy Object .
# Reads models/data_sdwan_local_application_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_381 = yamldecode(file("${path.module}/../models/data_sdwan_local_application_list_policy_object.yml"))["data_sdwan_local_application_list_policy_object"]
}

data "sdwan_local_application_list_policy_object" "n381" {
  id = local.m_381["id"]
}

output "n381_data_sdwan_local_application_list_policy_object_id" {
  value = data.sdwan_local_application_list_policy_object.n381.id
}
