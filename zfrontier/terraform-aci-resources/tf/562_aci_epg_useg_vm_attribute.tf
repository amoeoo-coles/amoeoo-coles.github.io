# 562 · resource aci_epg_useg_vm_attribute · 4. Application
# Manages ACI EPG uSeg VM Attribute
# APIC class: fvVmAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/crtrn-{name}/vmattr-{name} | uni/tn-{name}/ap-{name}/epg-{name}/crtrn/vmattr-{name}
# Reads models/aci_epg_useg_vm_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_562 = yamldecode(file("${path.module}/../models/aci_epg_useg_vm_attribute.yml"))["aci_epg_useg_vm_attribute"]
}

resource "aci_epg_useg_vm_attribute" "n562" {
  annotation  = local.m_562["annotation"]
  annotations = local.m_562["annotations"]
  category    = local.m_562["category"]
  description = local.m_562["description"]
  label_name  = local.m_562["label_name"]
  name        = local.m_562["name"]
  name_alias  = local.m_562["name_alias"]
  operator    = local.m_562["operator"]
  owner_key   = local.m_562["owner_key"]
  owner_tag   = local.m_562["owner_tag"]
  parent_dn   = local.m_562["parent_dn"]
  tags        = local.m_562["tags"]
  type        = local.m_562["type"]
  value       = local.m_562["value"]
}
