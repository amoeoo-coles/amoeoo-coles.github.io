# 668 · data source aci_cloud_availability_zone · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Availability Zone
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_availability_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_668 = yamldecode(file("${path.module}/../models/data_aci_cloud_availability_zone.yml"))["data_aci_cloud_availability_zone"]
}

data "aci_cloud_availability_zone" "n668" {
  annotation                = local.m_668["annotation"]
  cloud_providers_region_dn = local.m_668["cloud_providers_region_dn"]
  name                      = local.m_668["name"]
  name_alias                = local.m_668["name_alias"]
}

output "n668_data_aci_cloud_availability_zone_id" {
  value = data.aci_cloud_availability_zone.n668.id
}
