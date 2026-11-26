# 343 · resource aci_neighbor_discovery_interface_policy · 3. Tenant and networking
# Manages ACI Neighbor Discovery Interface Policy
# APIC class: ndIfPol · DN: uni/tn-{name}/ndifpol-{name}
# Reads models/aci_neighbor_discovery_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_343 = yamldecode(file("${path.module}/../models/aci_neighbor_discovery_interface_policy.yml"))["aci_neighbor_discovery_interface_policy"]
}

resource "aci_neighbor_discovery_interface_policy" "n343" {
  annotation                     = local.m_343["annotation"]
  annotations                    = local.m_343["annotations"]
  controller_state               = local.m_343["controller_state"]
  description                    = local.m_343["description"]
  hop_limit                      = local.m_343["hop_limit"]
  mtu                            = local.m_343["mtu"]
  name                           = local.m_343["name"]
  name_alias                     = local.m_343["name_alias"]
  neighbor_solicitation_interval = local.m_343["neighbor_solicitation_interval"]
  neighbor_solicitation_retries  = local.m_343["neighbor_solicitation_retries"]
  nud_retry_base                 = local.m_343["nud_retry_base"]
  nud_retry_interval             = local.m_343["nud_retry_interval"]
  nud_retry_max_attempts         = local.m_343["nud_retry_max_attempts"]
  owner_key                      = local.m_343["owner_key"]
  owner_tag                      = local.m_343["owner_tag"]
  parent_dn                      = local.m_343["parent_dn"]
  reachable_time                 = local.m_343["reachable_time"]
  retransmit_timer               = local.m_343["retransmit_timer"]
  router_advertisement_interval  = local.m_343["router_advertisement_interval"]
  router_advertisement_lifetime  = local.m_343["router_advertisement_lifetime"]
  tags                           = local.m_343["tags"]
}
