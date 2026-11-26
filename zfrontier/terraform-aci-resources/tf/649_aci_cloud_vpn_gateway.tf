# 649 · resource aci_cloud_vpn_gateway · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Vpn Gateway
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_vpn_gateway.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_649 = yamldecode(file("${path.module}/../models/aci_cloud_vpn_gateway.yml"))["aci_cloud_vpn_gateway"]
}

resource "aci_cloud_vpn_gateway" "n649" {
  annotation                           = local.m_649["annotation"]
  cloud_context_profile_dn             = local.m_649["cloud_context_profile_dn"]
  cloud_router_profile_type            = local.m_649["cloud_router_profile_type"]
  description                          = local.m_649["description"]
  name                                 = local.m_649["name"]
  name_alias                           = local.m_649["name_alias"]
  num_instances                        = local.m_649["num_instances"]
  relation_cloud_rs_to_direct_conn_pol = local.m_649["relation_cloud_rs_to_direct_conn_pol"]
  relation_cloud_rs_to_host_router_pol = local.m_649["relation_cloud_rs_to_host_router_pol"]
  relation_cloud_rs_to_vpn_gw_pol      = local.m_649["relation_cloud_rs_to_vpn_gw_pol"]
}
