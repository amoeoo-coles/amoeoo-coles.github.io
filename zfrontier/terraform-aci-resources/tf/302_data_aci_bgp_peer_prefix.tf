# 302 · data source aci_bgp_peer_prefix · 3. Tenant and networking
# Data source for ACI BGP Peer Prefix
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_peer_prefix.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_302 = yamldecode(file("${path.module}/../models/data_aci_bgp_peer_prefix.yml"))["data_aci_bgp_peer_prefix"]
}

data "aci_bgp_peer_prefix" "n302" {
  action       = local.m_302["action"]
  annotation   = local.m_302["annotation"]
  description  = local.m_302["description"]
  max_pfx      = local.m_302["max_pfx"]
  name         = local.m_302["name"]
  name_alias   = local.m_302["name_alias"]
  restart_time = local.m_302["restart_time"]
  tenant_dn    = local.m_302["tenant_dn"]
  thresh       = local.m_302["thresh"]
}

output "n302_data_aci_bgp_peer_prefix_id" {
  value = data.aci_bgp_peer_prefix.n302.id
}
