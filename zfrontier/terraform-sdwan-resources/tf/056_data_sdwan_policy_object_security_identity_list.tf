# 056 · data source sdwan_policy_object_security_identity_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Identity List Policy_object.
# Reads models/data_sdwan_policy_object_security_identity_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_identity_list.yml"))["data_sdwan_policy_object_security_identity_list"]
}

data "sdwan_policy_object_security_identity_list" "n056" {
  feature_profile_id = local.m_056["feature_profile_id"]
  id                 = local.m_056["id"]
  name               = local.m_056["name"]
}

output "n056_data_sdwan_policy_object_security_identity_list_id" {
  value = data.sdwan_policy_object_security_identity_list.n056.id
}
