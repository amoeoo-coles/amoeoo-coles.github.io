# 554 · resource aci_epg_useg_dns_attribute · 4. Application
# Manages ACI EPG uSeg DNS Attribute
# APIC class: fvDnsAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/dnsattr-{name}
# Reads models/aci_epg_useg_dns_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_554 = yamldecode(file("${path.module}/../models/aci_epg_useg_dns_attribute.yml"))["aci_epg_useg_dns_attribute"]
}

resource "aci_epg_useg_dns_attribute" "n554" {
  annotation  = local.m_554["annotation"]
  annotations = local.m_554["annotations"]
  description = local.m_554["description"]
  filter      = local.m_554["filter"]
  name        = local.m_554["name"]
  name_alias  = local.m_554["name_alias"]
  owner_key   = local.m_554["owner_key"]
  owner_tag   = local.m_554["owner_tag"]
  parent_dn   = local.m_554["parent_dn"]
  tags        = local.m_554["tags"]
}
