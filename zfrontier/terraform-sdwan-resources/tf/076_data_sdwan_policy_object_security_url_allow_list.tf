# 076 · data source sdwan_policy_object_security_url_allow_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security URL Allow List Policy_object.
# Reads models/data_sdwan_policy_object_security_url_allow_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_076 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_url_allow_list.yml"))["data_sdwan_policy_object_security_url_allow_list"]
}

data "sdwan_policy_object_security_url_allow_list" "n076" {
  feature_profile_id = local.m_076["feature_profile_id"]
  id                 = local.m_076["id"]
  name               = local.m_076["name"]
}

output "n076_data_sdwan_policy_object_security_url_allow_list_id" {
  value = data.sdwan_policy_object_security_url_allow_list.n076.id
}
