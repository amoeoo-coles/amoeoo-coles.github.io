# 558 · resource aci_epg_useg_mac_attribute · 4. Application
# Manages ACI EPG uSeg MAC Attribute
# APIC class: fvMacAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/macattr-{name}
# Reads models/aci_epg_useg_mac_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_558 = yamldecode(file("${path.module}/../models/aci_epg_useg_mac_attribute.yml"))["aci_epg_useg_mac_attribute"]
}

resource "aci_epg_useg_mac_attribute" "n558" {
  annotation  = local.m_558["annotation"]
  annotations = local.m_558["annotations"]
  description = local.m_558["description"]
  mac         = local.m_558["mac"]
  name        = local.m_558["name"]
  name_alias  = local.m_558["name_alias"]
  owner_key   = local.m_558["owner_key"]
  owner_tag   = local.m_558["owner_tag"]
  parent_dn   = local.m_558["parent_dn"]
  tags        = local.m_558["tags"]
}
