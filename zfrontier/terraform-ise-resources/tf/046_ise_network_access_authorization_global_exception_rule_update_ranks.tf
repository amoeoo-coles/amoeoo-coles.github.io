# 046 · resource ise_network_access_authorization_global_exception_rule_update_ranks · 5. Network access
# This resource is used to bulk update rank field in authorization global exception rule. It serves as a workaround for the ISE API/Backend limitation which restricts rank assignments to a strictly incremental sequence. By utilizing this resource and network_access_authorization_global_exception_rul
# Reads models/ise_network_access_authorization_global_exception_rule_update_ranks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_046 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_global_exception_rule_update_ranks.yml"))["ise_network_access_authorization_global_exception_rule_update_ranks"]
}

resource "ise_network_access_authorization_global_exception_rule_update_ranks" "n046" {
  rules = local.m_046["rules"]
}
