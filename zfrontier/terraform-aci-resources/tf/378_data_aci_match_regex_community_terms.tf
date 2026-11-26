# 378 · data source aci_match_regex_community_terms · 3. Tenant and networking
# Data source for ACI Match Rule Based on Community Regular Expression
# APIC class: not collected · DN: not collected
# Reads models/data_aci_match_regex_community_terms.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_378 = yamldecode(file("${path.module}/../models/data_aci_match_regex_community_terms.yml"))["data_aci_match_regex_community_terms"]
}

data "aci_match_regex_community_terms" "n378" {
  annotation     = local.m_378["annotation"]
  community_type = local.m_378["community_type"]
  description    = local.m_378["description"]
  match_rule_dn  = local.m_378["match_rule_dn"]
  name           = local.m_378["name"]
  name_alias     = local.m_378["name_alias"]
  regex          = local.m_378["regex"]
}

output "n378_data_aci_match_regex_community_terms_id" {
  value = data.aci_match_regex_community_terms.n378.id
}
