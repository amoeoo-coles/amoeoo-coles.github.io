# 068 · resource ise_device_admin_authentication_rule_update_ranks · 6. Device administration
# This resource is used to bulk update rank field in device admin authentication rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_authentication_rule resource, you can b
# Reads models/ise_device_admin_authentication_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/ise_device_admin_authentication_rule_update_ranks.yml"))["ise_device_admin_authentication_rule_update_ranks"]
}

resource "ise_device_admin_authentication_rule_update_ranks" "n068" {
  policy_set_id = local.m_068["policy_set_id"]
  rules = local.m_068["rules"]
}
