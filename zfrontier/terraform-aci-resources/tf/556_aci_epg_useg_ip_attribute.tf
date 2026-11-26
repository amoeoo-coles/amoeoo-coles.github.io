# 556 · resource aci_epg_useg_ip_attribute · 4. Application
# Manages ACI EPG uSeg IP Attribute
# APIC class: fvIpAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/ipattr-{name}
# Reads models/aci_epg_useg_ip_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_556 = yamldecode(file("${path.module}/../models/aci_epg_useg_ip_attribute.yml"))["aci_epg_useg_ip_attribute"]
}

resource "aci_epg_useg_ip_attribute" "n556" {
  annotation     = local.m_556["annotation"]
  annotations    = local.m_556["annotations"]
  description    = local.m_556["description"]
  ip             = local.m_556["ip"]
  name           = local.m_556["name"]
  name_alias     = local.m_556["name_alias"]
  owner_key      = local.m_556["owner_key"]
  owner_tag      = local.m_556["owner_tag"]
  parent_dn      = local.m_556["parent_dn"]
  tags           = local.m_556["tags"]
  use_epg_subnet = local.m_556["use_epg_subnet"]
}
