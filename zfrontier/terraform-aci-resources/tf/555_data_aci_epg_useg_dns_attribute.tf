# 555 · data source aci_epg_useg_dns_attribute · 4. Application
# Data source for ACI EPG uSeg DNS Attribute
# APIC class: fvDnsAttr · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/dnsattr-{name}
# Reads models/data_aci_epg_useg_dns_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_555 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_dns_attribute.yml"))["data_aci_epg_useg_dns_attribute"]
}

data "aci_epg_useg_dns_attribute" "n555" {
  name      = local.m_555["name"]
  parent_dn = local.m_555["parent_dn"]
}

output "n555_data_aci_epg_useg_dns_attribute_id" {
  value = data.aci_epg_useg_dns_attribute.n555.id
}
