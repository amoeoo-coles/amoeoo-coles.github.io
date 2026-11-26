# 039 · resource aci_ldap_group_map_rule · 1. System and fabric setup
# Manages ACI LDAP Group Map Rule
# APIC class: not collected · DN: not collected
# Reads models/aci_ldap_group_map_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/aci_ldap_group_map_rule.yml"))["aci_ldap_group_map_rule"]
}

resource "aci_ldap_group_map_rule" "n039" {
  annotation  = local.m_039["annotation"]
  description = local.m_039["description"]
  groupdn     = local.m_039["groupdn"]
  name        = local.m_039["name"]
  name_alias  = local.m_039["name_alias"]
  type        = local.m_039["type"]
}
