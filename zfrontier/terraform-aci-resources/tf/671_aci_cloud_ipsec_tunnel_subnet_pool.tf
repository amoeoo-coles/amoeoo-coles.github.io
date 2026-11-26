# 671 · resource aci_cloud_ipsec_tunnel_subnet_pool · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Subnet Pool for IPsec Tunnels
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_ipsec_tunnel_subnet_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_671 = yamldecode(file("${path.module}/../models/aci_cloud_ipsec_tunnel_subnet_pool.yml"))["aci_cloud_ipsec_tunnel_subnet_pool"]
}

resource "aci_cloud_ipsec_tunnel_subnet_pool" "n671" {
  annotation  = local.m_671["annotation"]
  description = local.m_671["description"]
  name        = local.m_671["name"]
  subnet_pool = local.m_671["subnet_pool"]
}
