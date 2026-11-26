# 187 · resource aci_access_generic · 2. Access policies
# Manages ACI Access Generic
# APIC class: not collected · DN: not collected
# Reads models/aci_access_generic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_187 = yamldecode(file("${path.module}/../models/aci_access_generic.yml"))["aci_access_generic"]
}

resource "aci_access_generic" "n187" {
  annotation                          = local.m_187["annotation"]
  attachable_access_entity_profile_dn = local.m_187["attachable_access_entity_profile_dn"]
  description                         = local.m_187["description"]
  name                                = local.m_187["name"]
  name_alias                          = local.m_187["name_alias"]
}
