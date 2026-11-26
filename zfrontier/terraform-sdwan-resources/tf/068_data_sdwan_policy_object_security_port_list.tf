# 068 · data source sdwan_policy_object_security_port_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Port List Policy_object.
# Reads models/data_sdwan_policy_object_security_port_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_port_list.yml"))["data_sdwan_policy_object_security_port_list"]
}

data "sdwan_policy_object_security_port_list" "n068" {
  feature_profile_id = local.m_068["feature_profile_id"]
  id                 = local.m_068["id"]
  name               = local.m_068["name"]
}

output "n068_data_sdwan_policy_object_security_port_list_id" {
  value = data.sdwan_policy_object_security_port_list.n068.id
}
