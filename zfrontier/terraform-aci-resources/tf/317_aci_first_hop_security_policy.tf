# 317 · resource aci_first_hop_security_policy · 3. Tenant and networking
# Manages ACI First Hop Security Policy
# APIC class: fhsBDPol · DN: uni/tn-{name}/bdpol-{name}
# Reads models/aci_first_hop_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_317 = yamldecode(file("${path.module}/../models/aci_first_hop_security_policy.yml"))["aci_first_hop_security_policy"]
}

resource "aci_first_hop_security_policy" "n317" {
  annotation                       = local.m_317["annotation"]
  annotations                      = local.m_317["annotations"]
  description                      = local.m_317["description"]
  ip_inspection                    = local.m_317["ip_inspection"]
  name                             = local.m_317["name"]
  name_alias                       = local.m_317["name_alias"]
  owner_key                        = local.m_317["owner_key"]
  owner_tag                        = local.m_317["owner_tag"]
  parent_dn                        = local.m_317["parent_dn"]
  route_advertisement_guard_policy = local.m_317["route_advertisement_guard_policy"]
  router_advertisement             = local.m_317["router_advertisement"]
  source_guard                     = local.m_317["source_guard"]
  tags                             = local.m_317["tags"]
}
