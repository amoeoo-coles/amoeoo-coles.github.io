# 070 · data source sdwan_policy_object_security_protocol_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Protocol List Policy_object.
# Reads models/data_sdwan_policy_object_security_protocol_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_protocol_list.yml"))["data_sdwan_policy_object_security_protocol_list"]
}

data "sdwan_policy_object_security_protocol_list" "n070" {
  feature_profile_id = local.m_070["feature_profile_id"]
  id                 = local.m_070["id"]
  name               = local.m_070["name"]
}

output "n070_data_sdwan_policy_object_security_protocol_list_id" {
  value = data.sdwan_policy_object_security_protocol_list.n070.id
}
