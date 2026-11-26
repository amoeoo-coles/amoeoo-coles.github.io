# 526 · resource aci_epg_useg_block_statement · 4. Application
# Manages ACI EPG uSeg Block Statement
# APIC class: fvCrtrn · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn
# Reads models/aci_epg_useg_block_statement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_526 = yamldecode(file("${path.module}/../models/aci_epg_useg_block_statement.yml"))["aci_epg_useg_block_statement"]
}

resource "aci_epg_useg_block_statement" "n526" {
  annotation  = local.m_526["annotation"]
  annotations = local.m_526["annotations"]
  description = local.m_526["description"]
  match       = local.m_526["match"]
  name        = local.m_526["name"]
  name_alias  = local.m_526["name_alias"]
  owner_key   = local.m_526["owner_key"]
  owner_tag   = local.m_526["owner_tag"]
  parent_dn   = local.m_526["parent_dn"]
  precedence  = local.m_526["precedence"]
  scope       = local.m_526["scope"]
  tags        = local.m_526["tags"]
}
