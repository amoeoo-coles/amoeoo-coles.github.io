# 067 · resource sdwan_policy_object_security_port_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Port List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_port_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_port_list.yml"))["sdwan_policy_object_security_port_list"]
}

resource "sdwan_policy_object_security_port_list" "n067" {
  description = local.m_067["description"]
  entries = local.m_067["entries"]
  feature_profile_id = local.m_067["feature_profile_id"]
  name = local.m_067["name"]
}
