# 040 · data source aci_ldap_group_map_rule · 1. System and fabric setup
# Data source for ACI LDAP Group Map Rule
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ldap_group_map_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/data_aci_ldap_group_map_rule.yml"))["data_aci_ldap_group_map_rule"]
}

data "aci_ldap_group_map_rule" "n040" {
  annotation  = local.m_040["annotation"]
  description = local.m_040["description"]
  groupdn     = local.m_040["groupdn"]
  name        = local.m_040["name"]
  name_alias  = local.m_040["name_alias"]
  type        = local.m_040["type"]
}

output "n040_data_aci_ldap_group_map_rule_id" {
  value = data.aci_ldap_group_map_rule.n040.id
}
