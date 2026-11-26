# 075 · resource ise_device_admin_authorization_global_exception_rule_update_rank · 6. Device administration
# This resource is used to update rank field in device admin authorization global exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and device_admin_authorization_global_excepti
# Reads models/ise_device_admin_authorization_global_exception_rule_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_075 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_global_exception_rule_update_rank.yml"))["ise_device_admin_authorization_global_exception_rule_update_rank"]
}

resource "ise_device_admin_authorization_global_exception_rule_update_rank" "n075" {
  rank = local.m_075["rank"]
  rule_id = local.m_075["rule_id"]
}
