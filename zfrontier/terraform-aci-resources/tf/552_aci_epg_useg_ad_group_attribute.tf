# 552 · resource aci_epg_useg_ad_group_attribute · 4. Application
# Manages ACI EPG uSeg AD Group Attribute
# APIC class: fvIdGroupAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/idgattr-[{selector}]
# Reads models/aci_epg_useg_ad_group_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_552 = yamldecode(file("${path.module}/../models/aci_epg_useg_ad_group_attribute.yml"))["aci_epg_useg_ad_group_attribute"]
}

resource "aci_epg_useg_ad_group_attribute" "n552" {
  annotation  = local.m_552["annotation"]
  annotations = local.m_552["annotations"]
  description = local.m_552["description"]
  name        = local.m_552["name"]
  name_alias  = local.m_552["name_alias"]
  owner_key   = local.m_552["owner_key"]
  owner_tag   = local.m_552["owner_tag"]
  parent_dn   = local.m_552["parent_dn"]
  selector    = local.m_552["selector"]
  tags        = local.m_552["tags"]
}
