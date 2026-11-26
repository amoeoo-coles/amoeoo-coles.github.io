# 670 · data source aci_cloud_domain_profile · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Domain Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_domain_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_670 = yamldecode(file("${path.module}/../models/data_aci_cloud_domain_profile.yml"))["data_aci_cloud_domain_profile"]
}

data "aci_cloud_domain_profile" "n670" {
  annotation  = local.m_670["annotation"]
  description = local.m_670["description"]
  name_alias  = local.m_670["name_alias"]
  site_id     = local.m_670["site_id"]
}

output "n670_data_aci_cloud_domain_profile_id" {
  value = data.aci_cloud_domain_profile.n670.id
}
