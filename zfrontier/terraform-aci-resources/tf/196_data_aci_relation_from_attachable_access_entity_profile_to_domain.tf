# 196 · data source aci_relation_from_attachable_access_entity_profile_to_domain · 2. Access policies
# Data source for ACI Relation From Attachable Access Entity Profile To Domain
# APIC class: infraRsDomP · DN: uni/infra/attentp-{name}/rsdomP-[{tDn}]
# Reads models/data_aci_relation_from_attachable_access_entity_profile_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_196 = yamldecode(file("${path.module}/../models/data_aci_relation_from_attachable_access_entity_profile_to_domain.yml"))["data_aci_relation_from_attachable_access_entity_profile_to_domain"]
}

data "aci_relation_from_attachable_access_entity_profile_to_domain" "n196" {
  parent_dn = local.m_196["parent_dn"]
  target_dn = local.m_196["target_dn"]
}

output "n196_data_aci_relation_from_attachable_access_entity_profile_to_domain_id" {
  value = data.aci_relation_from_attachable_access_entity_profile_to_domain.n196.id
}
