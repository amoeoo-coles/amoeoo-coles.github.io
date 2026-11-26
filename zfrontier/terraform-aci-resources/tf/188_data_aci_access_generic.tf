# 188 · data source aci_access_generic · 2. Access policies
# Data source for ACI Access Generic
# APIC class: not collected · DN: not collected
# Reads models/data_aci_access_generic.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_188 = yamldecode(file("${path.module}/../models/data_aci_access_generic.yml"))["data_aci_access_generic"]
}

data "aci_access_generic" "n188" {
  annotation                          = local.m_188["annotation"]
  attachable_access_entity_profile_dn = local.m_188["attachable_access_entity_profile_dn"]
  description                         = local.m_188["description"]
  name                                = local.m_188["name"]
  name_alias                          = local.m_188["name_alias"]
}

output "n188_data_aci_access_generic_id" {
  value = data.aci_access_generic.n188.id
}
