# 037 · resource aci_ldap_group_map · 1. System and fabric setup
# Manages ACI LDAP Group Map
# APIC class: not collected · DN: not collected
# Reads models/aci_ldap_group_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_037 = yamldecode(file("${path.module}/../models/aci_ldap_group_map.yml"))["aci_ldap_group_map"]
}

resource "aci_ldap_group_map" "n037" {
  annotation  = local.m_037["annotation"]
  description = local.m_037["description"]
  name        = local.m_037["name"]
  name_alias  = local.m_037["name_alias"]
  type        = local.m_037["type"]
}
