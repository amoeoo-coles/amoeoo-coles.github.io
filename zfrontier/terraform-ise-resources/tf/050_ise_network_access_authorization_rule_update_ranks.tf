# 050 · resource ise_network_access_authorization_rule_update_ranks · 5. Network access
# This resource is used to bulk update rank field in network access authorization rules. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_policy_set resource, you can bypass
# Reads models/ise_network_access_authorization_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_rule_update_ranks.yml"))["ise_network_access_authorization_rule_update_ranks"]
}

resource "ise_network_access_authorization_rule_update_ranks" "n050" {
  policy_set_id = local.m_050["policy_set_id"]
  rules = local.m_050["rules"]
}
