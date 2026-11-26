# 053 · resource catalystcenter_ip_pool · 3. Network settings and tags
# This resource manages an IP global pool using the new API schema.
# Reads models/catalystcenter_ip_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_053 = yamldecode(file("${path.module}/../models/catalystcenter_ip_pool.yml"))["catalystcenter_ip_pool"]
}

resource "catalystcenter_ip_pool" "n053" {
  address_space_dhcp_servers  = local.m_053["address_space_dhcp_servers"]
  address_space_dns_servers   = local.m_053["address_space_dns_servers"]
  address_space_gateway       = local.m_053["address_space_gateway"]
  address_space_prefix_length = local.m_053["address_space_prefix_length"]
  address_space_subnet        = local.m_053["address_space_subnet"]
  name                        = local.m_053["name"]
  pool_type                   = local.m_053["pool_type"]
}
