# 563 · data source aci_epg_useg_vm_attribute · 4. Application
# Data source for ACI EPG uSeg VM Attribute
# APIC class: fvVmAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/crtrn-{name}/vmattr-{name} | uni/tn-{name}/ap-{name}/epg-{name}/crtrn/vmattr-{name}
# Reads models/data_aci_epg_useg_vm_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_563 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_vm_attribute.yml"))["data_aci_epg_useg_vm_attribute"]
}

data "aci_epg_useg_vm_attribute" "n563" {
  name      = local.m_563["name"]
  parent_dn = local.m_563["parent_dn"]
}

output "n563_data_aci_epg_useg_vm_attribute_id" {
  value = data.aci_epg_useg_vm_attribute.n563.id
}
