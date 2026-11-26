# 507 · resource sdwan_rewrite_rule_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Rewrite Rule Policy Definition .
# Reads models/sdwan_rewrite_rule_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_507 = yamldecode(file("${path.module}/../models/sdwan_rewrite_rule_policy_definition.yml"))["sdwan_rewrite_rule_policy_definition"]
}

resource "sdwan_rewrite_rule_policy_definition" "n507" {
  description = local.m_507["description"]
  name        = local.m_507["name"]
  rules       = local.m_507["rules"]
}
