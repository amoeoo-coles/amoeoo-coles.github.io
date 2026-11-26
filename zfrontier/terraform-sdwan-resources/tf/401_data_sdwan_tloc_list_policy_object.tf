# 401 · data source sdwan_tloc_list_policy_object · 10. (Classic) policy objects
# This data source can read the TLOC List Policy Object .
# Reads models/data_sdwan_tloc_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_401 = yamldecode(file("${path.module}/../models/data_sdwan_tloc_list_policy_object.yml"))["data_sdwan_tloc_list_policy_object"]
}

data "sdwan_tloc_list_policy_object" "n401" {
  id = local.m_401["id"]
}

output "n401_data_sdwan_tloc_list_policy_object_id" {
  value = data.sdwan_tloc_list_policy_object.n401.id
}
