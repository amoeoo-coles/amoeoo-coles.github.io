# 041 · resource aci_ldap_group_map_rule_to_group_map · 1. System and fabric setup
# Manages ACI LDAP Group Map Rule to Group Map Ref
# APIC class: not collected · DN: not collected
# Reads models/aci_ldap_group_map_rule_to_group_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/aci_ldap_group_map_rule_to_group_map.yml"))["aci_ldap_group_map_rule_to_group_map"]
}

resource "aci_ldap_group_map_rule_to_group_map" "n041" {
  annotation        = local.m_041["annotation"]
  description       = local.m_041["description"]
  ldap_group_map_dn = local.m_041["ldap_group_map_dn"]
  name              = local.m_041["name"]
  name_alias        = local.m_041["name_alias"]
}
