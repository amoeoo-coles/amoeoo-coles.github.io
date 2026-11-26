# 355 · data source sdwan_block_url_list_policy_object · 10. (Classic) policy objects
# This data source can read the Block URL List Policy Object .
# Reads models/data_sdwan_block_url_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_355 = yamldecode(file("${path.module}/../models/data_sdwan_block_url_list_policy_object.yml"))["data_sdwan_block_url_list_policy_object"]
}

data "sdwan_block_url_list_policy_object" "n355" {
  id = local.m_355["id"]
}

output "n355_data_sdwan_block_url_list_policy_object_id" {
  value = data.sdwan_block_url_list_policy_object.n355.id
}
