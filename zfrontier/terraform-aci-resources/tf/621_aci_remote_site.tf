# 621 · resource aci_remote_site · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Remote Site
# APIC class: fvRemoteId · DN: uni/tn-{name}/BD-{name}/stAsc/site-{siteId} | uni/tn-{name}/ap-{name}/epg-{name}/stAsc/site-{siteId} | uni/tn-{name}/ctx-{name}/stAsc/site-{siteId} | uni/tn-{name}/mscGraphXlateCont/epgDefXlate-[{epgDefDn}]/stAsc/site-{siteId} | uni/tn-{name}/out-{name}/instP-{name}/stAsc/site-{siteId}
# Reads models/aci_remote_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_621 = yamldecode(file("${path.module}/../models/aci_remote_site.yml"))["aci_remote_site"]
}

resource "aci_remote_site" "n621" {
  annotation        = local.m_621["annotation"]
  annotations       = local.m_621["annotations"]
  description       = local.m_621["description"]
  name              = local.m_621["name"]
  name_alias        = local.m_621["name_alias"]
  owner_key         = local.m_621["owner_key"]
  owner_tag         = local.m_621["owner_tag"]
  parent_dn         = local.m_621["parent_dn"]
  remote_pc_tag     = local.m_621["remote_pc_tag"]
  remote_vrf_pc_tag = local.m_621["remote_vrf_pc_tag"]
  site_id           = local.m_621["site_id"]
  tags              = local.m_621["tags"]
}
