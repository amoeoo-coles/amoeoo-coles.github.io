# 553 · data source aci_epg_useg_ad_group_attribute · 4. Application
# Data source for ACI EPG uSeg AD Group Attribute
# APIC class: fvIdGroupAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/idgattr-[{selector}]
# Reads models/data_aci_epg_useg_ad_group_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_553 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_ad_group_attribute.yml"))["data_aci_epg_useg_ad_group_attribute"]
}

data "aci_epg_useg_ad_group_attribute" "n553" {
  parent_dn = local.m_553["parent_dn"]
  selector  = local.m_553["selector"]
}

output "n553_data_aci_epg_useg_ad_group_attribute_id" {
  value = data.aci_epg_useg_ad_group_attribute.n553.id
}
