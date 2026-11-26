# 147 · resource aci_fibre_channel_interface_policy · 2. Access policies
# Manages ACI Fibre Channel Interface Policy
# APIC class: fcIfPol · DN: uni/infra/fcIfPol-{name}
# Reads models/aci_fibre_channel_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_147 = yamldecode(file("${path.module}/../models/aci_fibre_channel_interface_policy.yml"))["aci_fibre_channel_interface_policy"]
}

resource "aci_fibre_channel_interface_policy" "n147" {
  annotation            = local.m_147["annotation"]
  annotations           = local.m_147["annotations"]
  auto_max_speed        = local.m_147["auto_max_speed"]
  description           = local.m_147["description"]
  fill_pattern          = local.m_147["fill_pattern"]
  name                  = local.m_147["name"]
  name_alias            = local.m_147["name_alias"]
  owner_key             = local.m_147["owner_key"]
  owner_tag             = local.m_147["owner_tag"]
  port_mode             = local.m_147["port_mode"]
  receive_buffer_credit = local.m_147["receive_buffer_credit"]
  speed                 = local.m_147["speed"]
  tags                  = local.m_147["tags"]
  trunk_mode            = local.m_147["trunk_mode"]
}
