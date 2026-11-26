# 622 · data source aci_remote_site · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Remote Site
# APIC class: fvRemoteId · DN: uni/tn-{name}/BD-{name}/stAsc/site-{siteId} | uni/tn-{name}/ap-{name}/epg-{name}/stAsc/site-{siteId} | uni/tn-{name}/ctx-{name}/stAsc/site-{siteId} | uni/tn-{name}/mscGraphXlateCont/epgDefXlate-[{epgDefDn}]/stAsc/site-{siteId} | uni/tn-{name}/out-{name}/instP-{name}/stAsc/site-{siteId}
# Reads models/data_aci_remote_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_622 = yamldecode(file("${path.module}/../models/data_aci_remote_site.yml"))["data_aci_remote_site"]
}

data "aci_remote_site" "n622" {
  parent_dn = local.m_622["parent_dn"]
  site_id   = local.m_622["site_id"]
}

output "n622_data_aci_remote_site_id" {
  value = data.aci_remote_site.n622.id
}
