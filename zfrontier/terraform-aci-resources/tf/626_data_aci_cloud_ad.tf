# 626 · data source aci_cloud_ad · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Active Directory
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_ad.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_626 = yamldecode(file("${path.module}/../models/data_aci_cloud_ad.yml"))["data_aci_cloud_ad"]
}

data "aci_cloud_ad" "n626" {
  active_directory_id = local.m_626["active_directory_id"]
  annotation          = local.m_626["annotation"]
  description         = local.m_626["description"]
  name                = local.m_626["name"]
  name_alias          = local.m_626["name_alias"]
  tenant_dn           = local.m_626["tenant_dn"]
}

output "n626_data_aci_cloud_ad_id" {
  value = data.aci_cloud_ad.n626.id
}
