# 135 · resource aci_attachable_access_entity_profile · 2. Access policies
# Manages ACI Attachable Access Entity Profile
# APIC class: infraAttEntityP · DN: uni/infra/attentp-{name}
# Reads models/aci_attachable_access_entity_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_135 = yamldecode(file("${path.module}/../models/aci_attachable_access_entity_profile.yml"))["aci_attachable_access_entity_profile"]
}

resource "aci_attachable_access_entity_profile" "n135" {
  annotation              = local.m_135["annotation"]
  annotations             = local.m_135["annotations"]
  description             = local.m_135["description"]
  name                    = local.m_135["name"]
  name_alias              = local.m_135["name_alias"]
  owner_key               = local.m_135["owner_key"]
  owner_tag               = local.m_135["owner_tag"]
  relation_infra_rs_dom_p = local.m_135["relation_infra_rs_dom_p"]
  relation_to_domains     = local.m_135["relation_to_domains"]
  tags                    = local.m_135["tags"]
}
