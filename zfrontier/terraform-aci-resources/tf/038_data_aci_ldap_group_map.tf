# 038 · data source aci_ldap_group_map · 1. System and fabric setup
# Data source for ACI LDAP Group Map
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ldap_group_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_038 = yamldecode(file("${path.module}/../models/data_aci_ldap_group_map.yml"))["data_aci_ldap_group_map"]
}

data "aci_ldap_group_map" "n038" {
  annotation  = local.m_038["annotation"]
  description = local.m_038["description"]
  name        = local.m_038["name"]
  name_alias  = local.m_038["name_alias"]
  type        = local.m_038["type"]
}

output "n038_data_aci_ldap_group_map_id" {
  value = data.aci_ldap_group_map.n038.id
}
