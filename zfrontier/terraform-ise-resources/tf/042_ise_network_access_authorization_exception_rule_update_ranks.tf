# 042 · resource ise_network_access_authorization_exception_rule_update_ranks · 5. Network access
# This resource is used to bulk update rank field in network access authorization exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_authorization_exception_ru
# Reads models/ise_network_access_authorization_exception_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_exception_rule_update_ranks.yml"))["ise_network_access_authorization_exception_rule_update_ranks"]
}

resource "ise_network_access_authorization_exception_rule_update_ranks" "n042" {
  policy_set_id = local.m_042["policy_set_id"]
  rules         = local.m_042["rules"]
}
