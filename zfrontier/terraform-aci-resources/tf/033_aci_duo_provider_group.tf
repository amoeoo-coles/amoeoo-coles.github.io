# 033 · resource aci_duo_provider_group · 1. System and fabric setup
# Manages ACI Duo Provider Group
# APIC class: not collected · DN: not collected
# Reads models/aci_duo_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/aci_duo_provider_group.yml"))["aci_duo_provider_group"]
}

resource "aci_duo_provider_group" "n033" {
  annotation           = local.m_033["annotation"]
  auth_choice          = local.m_033["auth_choice"]
  description          = local.m_033["description"]
  ldap_group_map_ref   = local.m_033["ldap_group_map_ref"]
  name                 = local.m_033["name"]
  name_alias           = local.m_033["name_alias"]
  provider_type        = local.m_033["provider_type"]
  sec_fac_auth_methods = local.m_033["sec_fac_auth_methods"]
}
