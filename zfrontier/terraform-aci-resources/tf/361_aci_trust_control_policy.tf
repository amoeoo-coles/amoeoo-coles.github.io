# 361 · resource aci_trust_control_policy · 3. Tenant and networking
# Manages ACI Trust Control Policy
# APIC class: fhsTrustCtrlPol · DN: uni/tn-{name}/trustctrlpol-{name}
# Reads models/aci_trust_control_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_361 = yamldecode(file("${path.module}/../models/aci_trust_control_policy.yml"))["aci_trust_control_policy"]
}

resource "aci_trust_control_policy" "n361" {
  annotation        = local.m_361["annotation"]
  annotations       = local.m_361["annotations"]
  description       = local.m_361["description"]
  has_dhcpv4_server = local.m_361["has_dhcpv4_server"]
  has_dhcpv6_server = local.m_361["has_dhcpv6_server"]
  has_ipv6_router   = local.m_361["has_ipv6_router"]
  name              = local.m_361["name"]
  name_alias        = local.m_361["name_alias"]
  owner_key         = local.m_361["owner_key"]
  owner_tag         = local.m_361["owner_tag"]
  parent_dn         = local.m_361["parent_dn"]
  tags              = local.m_361["tags"]
  trust_arp         = local.m_361["trust_arp"]
  trust_nd          = local.m_361["trust_nd"]
  trust_ra          = local.m_361["trust_ra"]
}
