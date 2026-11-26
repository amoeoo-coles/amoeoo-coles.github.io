# 538 · resource sdwan_rule_set_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Rule Set Policy Definition .
# Reads models/sdwan_rule_set_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_538 = yamldecode(file("${path.module}/../models/sdwan_rule_set_policy_definition.yml"))["sdwan_rule_set_policy_definition"]
}

resource "sdwan_rule_set_policy_definition" "n538" {
  description = local.m_538["description"]
  name = local.m_538["name"]
  rules = local.m_538["rules"]
}
