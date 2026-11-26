# 559 · data source aci_epg_useg_mac_attribute · 4. Application
# Data source for ACI EPG uSeg MAC Attribute
# APIC class: fvMacAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/macattr-{name}
# Reads models/data_aci_epg_useg_mac_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_559 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_mac_attribute.yml"))["data_aci_epg_useg_mac_attribute"]
}

data "aci_epg_useg_mac_attribute" "n559" {
  name      = local.m_559["name"]
  parent_dn = local.m_559["parent_dn"]
}

output "n559_data_aci_epg_useg_mac_attribute_id" {
  value = data.aci_epg_useg_mac_attribute.n559.id
}
