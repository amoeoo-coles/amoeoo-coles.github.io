# 393 · data source sdwan_region_list_policy_object · 10. (Classic) policy objects
# This data source can read the Region List Policy Object .
# Reads models/data_sdwan_region_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_393 = yamldecode(file("${path.module}/../models/data_sdwan_region_list_policy_object.yml"))["data_sdwan_region_list_policy_object"]
}

data "sdwan_region_list_policy_object" "n393" {
  id = local.m_393["id"]
}

output "n393_data_sdwan_region_list_policy_object_id" {
  value = data.sdwan_region_list_policy_object.n393.id
}
