# 376 · data source aci_match_community_terms · 3. Tenant and networking
# Data source for ACI Match Community Term
# APIC class: not collected · DN: not collected
# Reads models/data_aci_match_community_terms.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_376 = yamldecode(file("${path.module}/../models/data_aci_match_community_terms.yml"))["data_aci_match_community_terms"]
}

data "aci_match_community_terms" "n376" {
  annotation    = local.m_376["annotation"]
  description   = local.m_376["description"]
  match_rule_dn = local.m_376["match_rule_dn"]
  name          = local.m_376["name"]
  name_alias    = local.m_376["name_alias"]
  dynamic "match_community_factors" {
    for_each = local.m_376["match_community_factors"] == null ? [] : local.m_376["match_community_factors"]
    content {
      community   = lookup(match_community_factors.value, "community", null)
      description = lookup(match_community_factors.value, "description", null)
      scope       = lookup(match_community_factors.value, "scope", null)
    }
  }
}

output "n376_data_aci_match_community_terms_id" {
  value = data.aci_match_community_terms.n376.id
}
