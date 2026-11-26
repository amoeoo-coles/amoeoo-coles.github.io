# 672 · data source aci_cloud_ipsec_tunnel_subnet_pool · 6. Multi-Pod, Multi-Site and Cloud
# Data source for the Cloud Network Controller Cloud Subnet Pool for IPsec Tunnels
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_ipsec_tunnel_subnet_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_672 = yamldecode(file("${path.module}/../models/data_aci_cloud_ipsec_tunnel_subnet_pool.yml"))["data_aci_cloud_ipsec_tunnel_subnet_pool"]
}

data "aci_cloud_ipsec_tunnel_subnet_pool" "n672" {
  annotation  = local.m_672["annotation"]
  description = local.m_672["description"]
  name        = local.m_672["name"]
  name_alias  = local.m_672["name_alias"]
  subnet_pool = local.m_672["subnet_pool"]
}

output "n672_data_aci_cloud_ipsec_tunnel_subnet_pool_id" {
  value = data.aci_cloud_ipsec_tunnel_subnet_pool.n672.id
}
