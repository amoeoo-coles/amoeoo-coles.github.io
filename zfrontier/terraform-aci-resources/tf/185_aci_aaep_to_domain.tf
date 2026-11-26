# 185 · resource aci_aaep_to_domain · 2. Access policies
# Manages the ACI Attachable Access Entity Profile (AAEP) to domain (VMM, Physical or External domain) relationship.
# APIC class: not collected · DN: not collected
# Reads models/aci_aaep_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_185 = yamldecode(file("${path.module}/../models/aci_aaep_to_domain.yml"))["aci_aaep_to_domain"]
}

resource "aci_aaep_to_domain" "n185" {
  annotation                          = local.m_185["annotation"]
  attachable_access_entity_profile_dn = local.m_185["attachable_access_entity_profile_dn"]
  description                         = local.m_185["description"]
  domain_dn                           = local.m_185["domain_dn"]
}
