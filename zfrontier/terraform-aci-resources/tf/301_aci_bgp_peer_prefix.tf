# 301 · resource aci_bgp_peer_prefix · 3. Tenant and networking
# Manages ACI BGP Peer Prefix
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_peer_prefix.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_301 = yamldecode(file("${path.module}/../models/aci_bgp_peer_prefix.yml"))["aci_bgp_peer_prefix"]
}

resource "aci_bgp_peer_prefix" "n301" {
  action       = local.m_301["action"]
  annotation   = local.m_301["annotation"]
  description  = local.m_301["description"]
  max_pfx      = local.m_301["max_pfx"]
  name         = local.m_301["name"]
  name_alias   = local.m_301["name_alias"]
  restart_time = local.m_301["restart_time"]
  tenant_dn    = local.m_301["tenant_dn"]
  thresh       = local.m_301["thresh"]
}
