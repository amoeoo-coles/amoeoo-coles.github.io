# 625 · resource aci_cloud_ad · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Active Directory
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_ad.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_625 = yamldecode(file("${path.module}/../models/aci_cloud_ad.yml"))["aci_cloud_ad"]
}

resource "aci_cloud_ad" "n625" {
  active_directory_id = local.m_625["active_directory_id"]
  annotation          = local.m_625["annotation"]
  description         = local.m_625["description"]
  name                = local.m_625["name"]
  name_alias          = local.m_625["name_alias"]
  tenant_dn           = local.m_625["tenant_dn"]
}
