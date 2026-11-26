# 038 · resource ise_network_access_authentication_rule_update_ranks · 5. Network access
# This resource is used to bulk update rank field in network access authentication rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_authentication_rule resource, you c
# Reads models/ise_network_access_authentication_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_038 = yamldecode(file("${path.module}/../models/ise_network_access_authentication_rule_update_ranks.yml"))["ise_network_access_authentication_rule_update_ranks"]
}

resource "ise_network_access_authentication_rule_update_ranks" "n038" {
  policy_set_id = local.m_038["policy_set_id"]
  rules         = local.m_038["rules"]
}
