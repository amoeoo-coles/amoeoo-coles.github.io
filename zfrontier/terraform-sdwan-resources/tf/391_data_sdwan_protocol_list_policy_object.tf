# 391 · data source sdwan_protocol_list_policy_object · 10. (Classic) policy objects
# This data source can read the Protocol List Policy Object .
# Reads models/data_sdwan_protocol_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_391 = yamldecode(file("${path.module}/../models/data_sdwan_protocol_list_policy_object.yml"))["data_sdwan_protocol_list_policy_object"]
}

data "sdwan_protocol_list_policy_object" "n391" {
  id = local.m_391["id"]
}

output "n391_data_sdwan_protocol_list_policy_object_id" {
  value = data.sdwan_protocol_list_policy_object.n391.id
}
