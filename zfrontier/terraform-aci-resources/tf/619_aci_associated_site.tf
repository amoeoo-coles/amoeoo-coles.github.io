# 619 · resource aci_associated_site · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Associated Site
# APIC class: fvSiteAssociated · DN: uni/tn-{name}/BD-{name}/stAsc | uni/tn-{name}/ap-{name}/epg-{name}/stAsc | uni/tn-{name}/ctx-{name}/stAsc | uni/tn-{name}/mscGraphXlateCont/epgDefXlate-[{epgDefDn}]/stAsc | uni/tn-{name}/out-{name}/instP-{name}/stAsc
# Reads models/aci_associated_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_619 = yamldecode(file("${path.module}/../models/aci_associated_site.yml"))["aci_associated_site"]
}

resource "aci_associated_site" "n619" {
  annotation   = local.m_619["annotation"]
  annotations  = local.m_619["annotations"]
  description  = local.m_619["description"]
  name         = local.m_619["name"]
  name_alias   = local.m_619["name_alias"]
  owner_key    = local.m_619["owner_key"]
  owner_tag    = local.m_619["owner_tag"]
  parent_dn    = local.m_619["parent_dn"]
  remote_sites = local.m_619["remote_sites"]
  site_id      = local.m_619["site_id"]
  tags         = local.m_619["tags"]
}
