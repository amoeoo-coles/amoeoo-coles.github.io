# 640 · data source aci_cloud_cidr_pool · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud CIDR Pool
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_cidr_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_640 = yamldecode(file("${path.module}/../models/data_aci_cloud_cidr_pool.yml"))["data_aci_cloud_cidr_pool"]
}

data "aci_cloud_cidr_pool" "n640" {
  addr                     = local.m_640["addr"]
  annotation               = local.m_640["annotation"]
  cloud_context_profile_dn = local.m_640["cloud_context_profile_dn"]
  description              = local.m_640["description"]
  name_alias               = local.m_640["name_alias"]
  primary                  = local.m_640["primary"]
}

output "n640_data_aci_cloud_cidr_pool_id" {
  value = data.aci_cloud_cidr_pool.n640.id
}
