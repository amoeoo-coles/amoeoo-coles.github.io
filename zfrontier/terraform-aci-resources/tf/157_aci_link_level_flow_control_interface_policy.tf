# 157 · resource aci_link_level_flow_control_interface_policy · 2. Access policies
# Manages ACI Link Level Flow Control Interface Policy
# APIC class: qosLlfcIfPol · DN: uni/infra/llfc-{name}
# Reads models/aci_link_level_flow_control_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_157 = yamldecode(file("${path.module}/../models/aci_link_level_flow_control_interface_policy.yml"))["aci_link_level_flow_control_interface_policy"]
}

resource "aci_link_level_flow_control_interface_policy" "n157" {
  annotation    = local.m_157["annotation"]
  annotations   = local.m_157["annotations"]
  description   = local.m_157["description"]
  name          = local.m_157["name"]
  name_alias    = local.m_157["name_alias"]
  owner_key     = local.m_157["owner_key"]
  owner_tag     = local.m_157["owner_tag"]
  receive_state = local.m_157["receive_state"]
  send_state    = local.m_157["send_state"]
  tags          = local.m_157["tags"]
}
