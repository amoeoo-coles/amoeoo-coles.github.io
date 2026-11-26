# 557 · data source aci_epg_useg_ip_attribute · 4. Application
# Data source for ACI EPG uSeg IP Attribute
# APIC class: fvIpAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/ipattr-{name}
# Reads models/data_aci_epg_useg_ip_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_557 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_ip_attribute.yml"))["data_aci_epg_useg_ip_attribute"]
}

data "aci_epg_useg_ip_attribute" "n557" {
  name      = local.m_557["name"]
  parent_dn = local.m_557["parent_dn"]
}

output "n557_data_aci_epg_useg_ip_attribute_id" {
  value = data.aci_epg_useg_ip_attribute.n557.id
}
