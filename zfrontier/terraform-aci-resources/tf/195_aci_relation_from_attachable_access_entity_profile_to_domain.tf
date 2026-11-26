# 195 · resource aci_relation_from_attachable_access_entity_profile_to_domain · 2. Access policies
# Manages ACI Relation From Attachable Access Entity Profile To Domain
# APIC class: infraRsDomP · DN: uni/infra/attentp-{name}/rsdomP-[{tDn}]
# Reads models/aci_relation_from_attachable_access_entity_profile_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_195 = yamldecode(file("${path.module}/../models/aci_relation_from_attachable_access_entity_profile_to_domain.yml"))["aci_relation_from_attachable_access_entity_profile_to_domain"]
}

resource "aci_relation_from_attachable_access_entity_profile_to_domain" "n195" {
  annotation  = local.m_195["annotation"]
  annotations = local.m_195["annotations"]
  parent_dn   = local.m_195["parent_dn"]
  tags        = local.m_195["tags"]
  target_dn   = local.m_195["target_dn"]
}
