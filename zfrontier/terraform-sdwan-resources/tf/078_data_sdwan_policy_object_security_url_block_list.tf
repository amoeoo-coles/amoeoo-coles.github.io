# 078 · data source sdwan_policy_object_security_url_block_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security URL Block List Policy_object.
# Reads models/data_sdwan_policy_object_security_url_block_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_url_block_list.yml"))["data_sdwan_policy_object_security_url_block_list"]
}

data "sdwan_policy_object_security_url_block_list" "n078" {
  feature_profile_id = local.m_078["feature_profile_id"]
  id                 = local.m_078["id"]
  name               = local.m_078["name"]
}

output "n078_data_sdwan_policy_object_security_url_block_list_id" {
  value = data.sdwan_policy_object_security_url_block_list.n078.id
}
