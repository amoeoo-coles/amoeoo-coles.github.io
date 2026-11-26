# 008 · data source aci_endpoint_ip_aging_profile · 1. System and fabric setup
# Data source for ACI Endpoint IP Aging Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_ip_aging_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/data_aci_endpoint_ip_aging_profile.yml"))["data_aci_endpoint_ip_aging_profile"]
}

data "aci_endpoint_ip_aging_profile" "n008" {
  admin_st    = local.m_008["admin_st"]
  annotation  = local.m_008["annotation"]
  description = local.m_008["description"]
  name_alias  = local.m_008["name_alias"]
}

output "n008_data_aci_endpoint_ip_aging_profile_id" {
  value = data.aci_endpoint_ip_aging_profile.n008.id
}
