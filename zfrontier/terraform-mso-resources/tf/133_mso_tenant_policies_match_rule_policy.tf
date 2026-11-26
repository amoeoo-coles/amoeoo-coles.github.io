# 133 · resource mso_tenant_policies_match_rule_policy · 10. Tenant policy templates
# Manages Match Rule Policies on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_match_rule_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_133 = yamldecode(file("${path.module}/../models/mso_tenant_policies_match_rule_policy.yml"))["mso_tenant_policies_match_rule_policy"]
}

resource "mso_tenant_policies_match_rule_policy" "n133" {
  description = local.m_133["description"]
  name        = local.m_133["name"]
  template_id = local.m_133["template_id"]
  dynamic "match_community_term" {
    for_each = local.m_133["match_community_term"] == null ? [] : local.m_133["match_community_term"]
    content {
      description = lookup(match_community_term.value, "description", null)
      name        = lookup(match_community_term.value, "name", null)
      dynamic "match_community_factor" {
        for_each = lookup(match_community_term.value, "match_community_factor", null) == null ? [] : match_community_term.value["match_community_factor"]
        content {
          community   = lookup(match_community_factor.value, "community", null)
          description = lookup(match_community_factor.value, "description", null)
          scope       = lookup(match_community_factor.value, "scope", null)
        }
      }
    }
  }
  dynamic "match_prefix" {
    for_each = local.m_133["match_prefix"] == null ? [] : local.m_133["match_prefix"]
    content {
      aggregate   = lookup(match_prefix.value, "aggregate", null)
      description = lookup(match_prefix.value, "description", null)
      from_prefix = lookup(match_prefix.value, "from_prefix", null)
      prefix      = lookup(match_prefix.value, "prefix", null)
      to_prefix   = lookup(match_prefix.value, "to_prefix", null)
    }
  }
}
