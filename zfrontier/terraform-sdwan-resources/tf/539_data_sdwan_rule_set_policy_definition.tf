# 539 · data source sdwan_rule_set_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Rule Set Policy Definition .
# Reads models/data_sdwan_rule_set_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_539 = yamldecode(file("${path.module}/../models/data_sdwan_rule_set_policy_definition.yml"))["data_sdwan_rule_set_policy_definition"]
}

data "sdwan_rule_set_policy_definition" "n539" {
  id = local.m_539["id"]
}

output "n539_data_sdwan_rule_set_policy_definition_id" {
  value = data.sdwan_rule_set_policy_definition.n539.id
}
