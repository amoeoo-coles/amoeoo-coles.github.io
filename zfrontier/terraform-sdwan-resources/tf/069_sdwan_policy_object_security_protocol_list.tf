# 069 · resource sdwan_policy_object_security_protocol_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Protocol List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_protocol_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_protocol_list.yml"))["sdwan_policy_object_security_protocol_list"]
}

resource "sdwan_policy_object_security_protocol_list" "n069" {
  description        = local.m_069["description"]
  entries            = local.m_069["entries"]
  feature_profile_id = local.m_069["feature_profile_id"]
  name               = local.m_069["name"]
}
