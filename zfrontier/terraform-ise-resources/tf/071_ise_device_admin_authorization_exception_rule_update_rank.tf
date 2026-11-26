# 071 · resource ise_device_admin_authorization_exception_rule_update_rank · 6. Device administration
# This resource is used to update rank field in device admin Authorization exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_authorization_exception_rule resour
# Reads models/ise_device_admin_authorization_exception_rule_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_071 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_exception_rule_update_rank.yml"))["ise_device_admin_authorization_exception_rule_update_rank"]
}

resource "ise_device_admin_authorization_exception_rule_update_rank" "n071" {
  policy_set_id = local.m_071["policy_set_id"]
  rank          = local.m_071["rank"]
  rule_id       = local.m_071["rule_id"]
}
