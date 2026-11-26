# 055 · resource sdwan_policy_object_security_identity_list · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Identity List Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_security_identity_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_identity_list.yml"))["sdwan_policy_object_security_identity_list"]
}

resource "sdwan_policy_object_security_identity_list" "n055" {
  description        = local.m_055["description"]
  entries            = local.m_055["entries"]
  feature_profile_id = local.m_055["feature_profile_id"]
  name               = local.m_055["name"]
}
