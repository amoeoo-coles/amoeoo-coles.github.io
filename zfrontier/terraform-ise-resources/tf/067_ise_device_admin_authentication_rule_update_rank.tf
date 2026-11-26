# 067 · resource ise_device_admin_authentication_rule_update_rank · 6. Device administration
# This resource is used to update rank field in device admin authentication rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_authentication_rule resource, you can bypass
# Reads models/ise_device_admin_authentication_rule_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/ise_device_admin_authentication_rule_update_rank.yml"))["ise_device_admin_authentication_rule_update_rank"]
}

resource "ise_device_admin_authentication_rule_update_rank" "n067" {
  policy_set_id = local.m_067["policy_set_id"]
  rank = local.m_067["rank"]
  rule_id = local.m_067["rule_id"]
}
