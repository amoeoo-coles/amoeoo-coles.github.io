# 071 · resource sdwan_policy_object_security_rule_set · 3. Policy objects and custom applications
# This resource can manage a Policy Object Security Rule Set Policy_object. Minimum SD-WAN Manager version: 20.18.2
# Reads models/sdwan_policy_object_security_rule_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_071 = yamldecode(file("${path.module}/../models/sdwan_policy_object_security_rule_set.yml"))["sdwan_policy_object_security_rule_set"]
}

resource "sdwan_policy_object_security_rule_set" "n071" {
  description        = local.m_071["description"]
  feature_profile_id = local.m_071["feature_profile_id"]
  name               = local.m_071["name"]
  sequences          = local.m_071["sequences"]
}
