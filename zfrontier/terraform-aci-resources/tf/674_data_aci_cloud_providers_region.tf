# 674 · data source aci_cloud_providers_region · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Providers Region
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_providers_region.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_674 = yamldecode(file("${path.module}/../models/data_aci_cloud_providers_region.yml"))["data_aci_cloud_providers_region"]
}

data "aci_cloud_providers_region" "n674" {
  admin_st                  = local.m_674["admin_st"]
  annotation                = local.m_674["annotation"]
  cloud_provider_profile_dn = local.m_674["cloud_provider_profile_dn"]
  name                      = local.m_674["name"]
  name_alias                = local.m_674["name_alias"]
}

output "n674_data_aci_cloud_providers_region_id" {
  value = data.aci_cloud_providers_region.n674.id
}
