# 377 · resource aci_match_regex_community_terms · 3. Tenant and networking
# Manages ACI Match Rule Based on Community Regular Expression
# APIC class: not collected · DN: not collected
# Reads models/aci_match_regex_community_terms.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_377 = yamldecode(file("${path.module}/../models/aci_match_regex_community_terms.yml"))["aci_match_regex_community_terms"]
}

resource "aci_match_regex_community_terms" "n377" {
  annotation     = local.m_377["annotation"]
  community_type = local.m_377["community_type"]
  description    = local.m_377["description"]
  match_rule_dn  = local.m_377["match_rule_dn"]
  name           = local.m_377["name"]
  name_alias     = local.m_377["name_alias"]
  regex          = local.m_377["regex"]
}
