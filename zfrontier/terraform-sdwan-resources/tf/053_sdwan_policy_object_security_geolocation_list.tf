# 053 · resource sdwan_policy_object_security_geolocation_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Geolocation List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_geolocation_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_053 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_geolocation_list.yml"))["sdwan_policy_object_security_geolocation_list"]
}

resource "sdwan_policy_object_security_geolocation_list" "n053" {
  description        = local.m_053["description"]
  entries            = local.m_053["entries"]
  feature_profile_id = local.m_053["feature_profile_id"]
  name               = local.m_053["name"]
}
