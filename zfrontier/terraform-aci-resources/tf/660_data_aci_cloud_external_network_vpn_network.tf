# 660 · data source aci_cloud_external_network_vpn_network · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Template for VPN Network
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_external_network_vpn_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_660 = yamldecode(file("${path.module}/../models/data_aci_cloud_external_network_vpn_network.yml"))["data_aci_cloud_external_network_vpn_network"]
}

data "aci_cloud_external_network_vpn_network" "n660" {
  aci_cloud_external_network_dn = local.m_660["aci_cloud_external_network_dn"]
  annotation                    = local.m_660["annotation"]
  description                   = local.m_660["description"]
  name                          = local.m_660["name"]
  name_alias                    = local.m_660["name_alias"]
  remote_site_id                = local.m_660["remote_site_id"]
  remote_site_name              = local.m_660["remote_site_name"]
  dynamic "ipsec_tunnel" {
    for_each = local.m_660["ipsec_tunnel"] == null ? [] : local.m_660["ipsec_tunnel"]
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

output "n660_data_aci_cloud_external_network_vpn_network_id" {
  value = data.aci_cloud_external_network_vpn_network.n660.id
}
