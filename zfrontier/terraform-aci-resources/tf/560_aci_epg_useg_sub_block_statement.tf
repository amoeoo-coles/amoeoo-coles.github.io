# 560 · resource aci_epg_useg_sub_block_statement · 4. Application
# Manages ACI EPG uSeg Sub Block Statement
# APIC class: fvSCrtrn · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/crtrn-{name}
# Reads models/aci_epg_useg_sub_block_statement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_560 = yamldecode(file("${path.module}/../models/aci_epg_useg_sub_block_statement.yml"))["aci_epg_useg_sub_block_statement"]
}

resource "aci_epg_useg_sub_block_statement" "n560" {
  annotation  = local.m_560["annotation"]
  annotations = local.m_560["annotations"]
  description = local.m_560["description"]
  match       = local.m_560["match"]
  name        = local.m_560["name"]
  name_alias  = local.m_560["name_alias"]
  owner_key   = local.m_560["owner_key"]
  owner_tag   = local.m_560["owner_tag"]
  parent_dn   = local.m_560["parent_dn"]
  tags        = local.m_560["tags"]
}
