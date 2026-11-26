# 648 · data source aci_cloud_service_epg · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud Service EPG
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_service_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_648 = yamldecode(file("${path.module}/../models/data_aci_cloud_service_epg.yml"))["data_aci_cloud_service_epg"]
}

data "aci_cloud_service_epg" "n648" {
  annotation                     = local.m_648["annotation"]
  cloud_application_container_dn = local.m_648["cloud_application_container_dn"]
  description                    = local.m_648["description"]
  name                           = local.m_648["name"]
  name_alias                     = local.m_648["name_alias"]
}

output "n648_data_aci_cloud_service_epg_id" {
  value = data.aci_cloud_service_epg.n648.id
}
