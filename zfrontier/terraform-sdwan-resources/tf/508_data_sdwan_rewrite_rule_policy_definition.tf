# 508 · data source sdwan_rewrite_rule_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Rewrite Rule Policy Definition .
# Reads models/data_sdwan_rewrite_rule_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_508 = yamldecode(file("${path.module}/../models/data_sdwan_rewrite_rule_policy_definition.yml"))["data_sdwan_rewrite_rule_policy_definition"]
}

data "sdwan_rewrite_rule_policy_definition" "n508" {
  id = local.m_508["id"]
}

output "n508_data_sdwan_rewrite_rule_policy_definition_id" {
  value = data.sdwan_rewrite_rule_policy_definition.n508.id
}
