# 273 · resource fmc_access_rules · 3. Policies
# This is an early access resource and it's behaviour may change in future releases. This resource manages Access Rules in Access Control Policies in bulk. Order of the rules is meant to be preserved within the resource, however not between multiple fmc_access_rules resources that create rules withi
# Reads models/fmc_access_rules.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_273 = yamldecode(file("${path.module}/../models/fmc_access_rules.yml"))["fmc_access_rules"]
}

resource "fmc_access_rules" "n273" {
  access_control_policy_id = local.m_273["access_control_policy_id"]
  category_name = local.m_273["category_name"]
  domain = local.m_273["domain"]
  items = local.m_273["items"]
  section = local.m_273["section"]
}
