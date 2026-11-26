# 141 · resource aci_dot1x_port_authentication_interface_policy · 2. Access policies
# Manages ACI 802.1x Port Authentication Interface Policy
# APIC class: l2PortAuthPol · DN: uni/infra/portauthpol-{name}
# Reads models/aci_dot1x_port_authentication_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_141 = yamldecode(file("${path.module}/../models/aci_dot1x_port_authentication_interface_policy.yml"))["aci_dot1x_port_authentication_interface_policy"]
}

resource "aci_dot1x_port_authentication_interface_policy" "n141" {
  admin_state   = local.m_141["admin_state"]
  annotation    = local.m_141["annotation"]
  annotations   = local.m_141["annotations"]
  configuration = local.m_141["configuration"]
  description   = local.m_141["description"]
  host_mode     = local.m_141["host_mode"]
  name          = local.m_141["name"]
  name_alias    = local.m_141["name_alias"]
  owner_key     = local.m_141["owner_key"]
  owner_tag     = local.m_141["owner_tag"]
  tags          = local.m_141["tags"]
}
