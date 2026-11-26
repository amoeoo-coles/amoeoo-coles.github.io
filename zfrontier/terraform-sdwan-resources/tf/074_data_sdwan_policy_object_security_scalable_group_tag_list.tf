# 074 · data source sdwan_policy_object_security_scalable_group_tag_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Scalable Group Tag List Policy_object.
# Reads models/data_sdwan_policy_object_security_scalable_group_tag_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_scalable_group_tag_list.yml"))["data_sdwan_policy_object_security_scalable_group_tag_list"]
}

data "sdwan_policy_object_security_scalable_group_tag_list" "n074" {
  feature_profile_id = local.m_074["feature_profile_id"]
  id                 = local.m_074["id"]
  name               = local.m_074["name"]
}

output "n074_data_sdwan_policy_object_security_scalable_group_tag_list_id" {
  value = data.sdwan_policy_object_security_scalable_group_tag_list.n074.id
}
