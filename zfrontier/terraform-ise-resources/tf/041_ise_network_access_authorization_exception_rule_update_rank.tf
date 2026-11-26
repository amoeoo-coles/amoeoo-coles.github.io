# 041 · resource ise_network_access_authorization_exception_rule_update_rank · 5. Network access
# This resource is used to update rank field in network access authorization exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_authorization_exception_rule re
# Reads models/ise_network_access_authorization_exception_rule_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_exception_rule_update_rank.yml"))["ise_network_access_authorization_exception_rule_update_rank"]
}

resource "ise_network_access_authorization_exception_rule_update_rank" "n041" {
  policy_set_id = local.m_041["policy_set_id"]
  rank = local.m_041["rank"]
  rule_id = local.m_041["rule_id"]
}
