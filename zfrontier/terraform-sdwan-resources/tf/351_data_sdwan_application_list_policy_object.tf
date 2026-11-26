# 351 · data source sdwan_application_list_policy_object · 10. (Classic) policy objects
# This data source can read the Application List Policy Object .
# Reads models/data_sdwan_application_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_351 = yamldecode(file("${path.module}/../models/data_sdwan_application_list_policy_object.yml"))["data_sdwan_application_list_policy_object"]
}

data "sdwan_application_list_policy_object" "n351" {
  id = local.m_351["id"]
}

output "n351_data_sdwan_application_list_policy_object_id" {
  value = data.sdwan_application_list_policy_object.n351.id
}
