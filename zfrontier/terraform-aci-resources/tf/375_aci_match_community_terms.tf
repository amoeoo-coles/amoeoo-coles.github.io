# 375 · resource aci_match_community_terms · 3. Tenant and networking
# Manages ACI Match Community Term
# APIC class: not collected · DN: not collected
# Reads models/aci_match_community_terms.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_375 = yamldecode(file("${path.module}/../models/aci_match_community_terms.yml"))["aci_match_community_terms"]
}

resource "aci_match_community_terms" "n375" {
  annotation    = local.m_375["annotation"]
  description   = local.m_375["description"]
  match_rule_dn = local.m_375["match_rule_dn"]
  name          = local.m_375["name"]
  name_alias    = local.m_375["name_alias"]
  dynamic "match_community_factors" {
    for_each = local.m_375["match_community_factors"] == null ? [] : local.m_375["match_community_factors"]
    content {
      community   = lookup(match_community_factors.value, "community", null)
      description = lookup(match_community_factors.value, "description", null)
      scope       = lookup(match_community_factors.value, "scope", null)
    }
  }
}
