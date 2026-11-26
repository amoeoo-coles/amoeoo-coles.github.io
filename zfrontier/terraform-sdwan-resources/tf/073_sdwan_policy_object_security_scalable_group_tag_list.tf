# 073 · resource sdwan_policy_object_security_scalable_group_tag_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Scalable Group Tag List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_scalable_group_tag_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_scalable_group_tag_list.yml"))["sdwan_policy_object_security_scalable_group_tag_list"]
}

resource "sdwan_policy_object_security_scalable_group_tag_list" "n073" {
  description        = local.m_073["description"]
  entries            = local.m_073["entries"]
  feature_profile_id = local.m_073["feature_profile_id"]
  name               = local.m_073["name"]
}
