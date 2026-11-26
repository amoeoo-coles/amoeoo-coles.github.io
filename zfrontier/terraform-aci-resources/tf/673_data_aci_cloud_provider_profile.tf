# 673 · data source aci_cloud_provider_profile · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Provider Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_provider_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_673 = yamldecode(file("${path.module}/../models/data_aci_cloud_provider_profile.yml"))["data_aci_cloud_provider_profile"]
}

data "aci_cloud_provider_profile" "n673" {
  annotation = local.m_673["annotation"]
  vendor     = local.m_673["vendor"]
}

output "n673_data_aci_cloud_provider_profile_id" {
  value = data.aci_cloud_provider_profile.n673.id
}
