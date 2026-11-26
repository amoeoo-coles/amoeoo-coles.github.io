# 072 · resource ise_device_admin_authorization_exception_rule_update_ranks · 6. Device administration
# This resource is used to bulk update rank field in device admin Authorization exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_authorization_exception_rule r
# Reads models/ise_device_admin_authorization_exception_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_072 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_exception_rule_update_ranks.yml"))["ise_device_admin_authorization_exception_rule_update_ranks"]
}

resource "ise_device_admin_authorization_exception_rule_update_ranks" "n072" {
  policy_set_id = local.m_072["policy_set_id"]
  rules = local.m_072["rules"]
}
