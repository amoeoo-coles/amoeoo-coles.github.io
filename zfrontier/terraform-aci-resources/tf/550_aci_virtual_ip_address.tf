# 550 · resource aci_virtual_ip_address · 4. Application
# Manages ACI Virtual IP Address
# APIC class: fvVip · DN: uni/tn-{name}/ap-{name}/epg-{name}/vip-[{addr}]
# Reads models/aci_virtual_ip_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_550 = yamldecode(file("${path.module}/../models/aci_virtual_ip_address.yml"))["aci_virtual_ip_address"]
}

resource "aci_virtual_ip_address" "n550" {
  annotation  = local.m_550["annotation"]
  annotations = local.m_550["annotations"]
  description = local.m_550["description"]
  ip          = local.m_550["ip"]
  name        = local.m_550["name"]
  name_alias  = local.m_550["name_alias"]
  owner_key   = local.m_550["owner_key"]
  owner_tag   = local.m_550["owner_tag"]
  parent_dn   = local.m_550["parent_dn"]
  tags        = local.m_550["tags"]
}
