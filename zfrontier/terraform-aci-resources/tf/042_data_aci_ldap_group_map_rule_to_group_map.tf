# 042 · data source aci_ldap_group_map_rule_to_group_map · 1. System and fabric setup
# Data source for ACI LDAP Group Map Rule to Group Map Ref
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ldap_group_map_rule_to_group_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/data_aci_ldap_group_map_rule_to_group_map.yml"))["data_aci_ldap_group_map_rule_to_group_map"]
}

data "aci_ldap_group_map_rule_to_group_map" "n042" {
  annotation        = local.m_042["annotation"]
  description       = local.m_042["description"]
  ldap_group_map_dn = local.m_042["ldap_group_map_dn"]
  name              = local.m_042["name"]
  name_alias        = local.m_042["name_alias"]
}

output "n042_data_aci_ldap_group_map_rule_to_group_map_id" {
  value = data.aci_ldap_group_map_rule_to_group_map.n042.id
}
