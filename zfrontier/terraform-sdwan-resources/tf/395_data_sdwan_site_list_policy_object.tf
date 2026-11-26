# 395 · data source sdwan_site_list_policy_object · 10. (Classic) policy objects
# This data source can read the Site List Policy Object .
# Reads models/data_sdwan_site_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_395 = yamldecode(file("${path.module}/../models/data_sdwan_site_list_policy_object.yml"))["data_sdwan_site_list_policy_object"]
}

data "sdwan_site_list_policy_object" "n395" {
  id = local.m_395["id"]
}

output "n395_data_sdwan_site_list_policy_object_id" {
  value = data.sdwan_site_list_policy_object.n395.id
}
