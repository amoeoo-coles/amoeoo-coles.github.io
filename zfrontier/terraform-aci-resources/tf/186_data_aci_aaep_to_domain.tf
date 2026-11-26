# 186 · data source aci_aaep_to_domain · 2. Access policies
# Data source for ACI Attachable Access Entity Profile (AAEP) to domain (VMM, Physical or External domain) relationships.
# APIC class: not collected · DN: not collected
# Reads models/data_aci_aaep_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_186 = yamldecode(file("${path.module}/../models/data_aci_aaep_to_domain.yml"))["data_aci_aaep_to_domain"]
}

data "aci_aaep_to_domain" "n186" {
  annotation                          = local.m_186["annotation"]
  attachable_access_entity_profile_dn = local.m_186["attachable_access_entity_profile_dn"]
  description                         = local.m_186["description"]
  domain_dn                           = local.m_186["domain_dn"]
}

output "n186_data_aci_aaep_to_domain_id" {
  value = data.aci_aaep_to_domain.n186.id
}
