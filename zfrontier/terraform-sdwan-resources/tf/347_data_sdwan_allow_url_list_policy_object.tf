# 347 · data source sdwan_allow_url_list_policy_object · 10. (Classic) policy objects
# This data source can read the Allow URL List Policy Object .
# Reads models/data_sdwan_allow_url_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_347 = yamldecode(file("${path.module}/../models/data_sdwan_allow_url_list_policy_object.yml"))["data_sdwan_allow_url_list_policy_object"]
}

data "sdwan_allow_url_list_policy_object" "n347" {
  id = local.m_347["id"]
}

output "n347_data_sdwan_allow_url_list_policy_object_id" {
  value = data.sdwan_allow_url_list_policy_object.n347.id
}
