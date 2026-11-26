# 650 · data source aci_cloud_vpn_gateway · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Vpn Gateway
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_vpn_gateway.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_650 = yamldecode(file("${path.module}/../models/data_aci_cloud_vpn_gateway.yml"))["data_aci_cloud_vpn_gateway"]
}

data "aci_cloud_vpn_gateway" "n650" {
  annotation                = local.m_650["annotation"]
  cloud_context_profile_dn  = local.m_650["cloud_context_profile_dn"]
  cloud_router_profile_type = local.m_650["cloud_router_profile_type"]
  description               = local.m_650["description"]
  name                      = local.m_650["name"]
  name_alias                = local.m_650["name_alias"]
  num_instances             = local.m_650["num_instances"]
}

output "n650_data_aci_cloud_vpn_gateway_id" {
  value = data.aci_cloud_vpn_gateway.n650.id
}
