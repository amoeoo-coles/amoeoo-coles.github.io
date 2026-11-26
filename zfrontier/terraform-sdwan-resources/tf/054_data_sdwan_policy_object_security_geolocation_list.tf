# 054 · data source sdwan_policy_object_security_geolocation_list · 3. Policy objects and custom applications
# This data source can read the Policy Object Security Geolocation List Policy_object.
# Reads models/data_sdwan_policy_object_security_geolocation_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_security_geolocation_list.yml"))["data_sdwan_policy_object_security_geolocation_list"]
}

data "sdwan_policy_object_security_geolocation_list" "n054" {
  feature_profile_id = local.m_054["feature_profile_id"]
  id                 = local.m_054["id"]
  name               = local.m_054["name"]
}

output "n054_data_sdwan_policy_object_security_geolocation_list_id" {
  value = data.sdwan_policy_object_security_geolocation_list.n054.id
}
