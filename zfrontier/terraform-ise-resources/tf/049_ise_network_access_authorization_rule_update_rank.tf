# 049 · resource ise_network_access_authorization_rule_update_rank · 5. Network access
# This resource is used to update rank field in network access authorization rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_authorization_rule resource, you can bypa
# Reads models/ise_network_access_authorization_rule_update_rank.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_rule_update_rank.yml"))["ise_network_access_authorization_rule_update_rank"]
}

resource "ise_network_access_authorization_rule_update_rank" "n049" {
  policy_set_id = local.m_049["policy_set_id"]
  rank = local.m_049["rank"]
  rule_id = local.m_049["rule_id"]
}
