# 620 · data source aci_associated_site · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Associated Site
# APIC class: fvSiteAssociated · DN: uni/tn-{name}/BD-{name}/stAsc | uni/tn-{name}/ap-{name}/epg-{name}/stAsc | uni/tn-{name}/ctx-{name}/stAsc | uni/tn-{name}/mscGraphXlateCont/epgDefXlate-[{epgDefDn}]/stAsc | uni/tn-{name}/out-{name}/instP-{name}/stAsc
# Reads models/data_aci_associated_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_620 = yamldecode(file("${path.module}/../models/data_aci_associated_site.yml"))["data_aci_associated_site"]
}

data "aci_associated_site" "n620" {
  parent_dn = local.m_620["parent_dn"]
}

output "n620_data_aci_associated_site_id" {
  value = data.aci_associated_site.n620.id
}
