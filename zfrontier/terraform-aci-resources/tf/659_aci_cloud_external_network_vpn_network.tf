# 659 · resource aci_cloud_external_network_vpn_network · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Template for VPN Network
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_external_network_vpn_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_659 = yamldecode(file("${path.module}/../models/aci_cloud_external_network_vpn_network.yml"))["aci_cloud_external_network_vpn_network"]
}

resource "aci_cloud_external_network_vpn_network" "n659" {
  aci_cloud_external_network_dn = local.m_659["aci_cloud_external_network_dn"]
  annotation                    = local.m_659["annotation"]
  description                   = local.m_659["description"]
  name                          = local.m_659["name"]
  name_alias                    = local.m_659["name_alias"]
  remote_site_id                = local.m_659["remote_site_id"]
  remote_site_name              = local.m_659["remote_site_name"]
  dynamic "ipsec_tunnel" {
    for_each = local.m_659["ipsec_tunnel"] == null ? [] : local.m_659["ipsec_tunnel"]
    content {
      bgp_peer_asn      = lookup(ipsec_tunnel.value, "bgp_peer_asn", null)
      ike_version       = lookup(ipsec_tunnel.value, "ike_version", null)
      pre_shared_key    = lookup(ipsec_tunnel.value, "pre_shared_key", null)
      public_ip_address = lookup(ipsec_tunnel.value, "public_ip_address", null)
      source_interfaces = lookup(ipsec_tunnel.value, "source_interfaces", null)
      subnet_pool_name  = lookup(ipsec_tunnel.value, "subnet_pool_name", null)
    }
  }
}
