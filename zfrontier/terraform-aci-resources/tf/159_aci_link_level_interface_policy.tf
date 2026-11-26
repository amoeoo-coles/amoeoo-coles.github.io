# 159 · resource aci_link_level_interface_policy · 2. Access policies
# Manages ACI Link Level Interface Policy
# APIC class: fabricHIfPol · DN: uni/infra/hintfpol-{name}
# Reads models/aci_link_level_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_159 = yamldecode(file("${path.module}/../models/aci_link_level_interface_policy.yml"))["aci_link_level_interface_policy"]
}

resource "aci_link_level_interface_policy" "n159" {
  annotation          = local.m_159["annotation"]
  annotations         = local.m_159["annotations"]
  auto_negotiation    = local.m_159["auto_negotiation"]
  description         = local.m_159["description"]
  emi_retrain         = local.m_159["emi_retrain"]
  fec_mode            = local.m_159["fec_mode"]
  link_debounce       = local.m_159["link_debounce"]
  name                = local.m_159["name"]
  name_alias          = local.m_159["name_alias"]
  owner_key           = local.m_159["owner_key"]
  owner_tag           = local.m_159["owner_tag"]
  physical_media_type = local.m_159["physical_media_type"]
  port_delay          = local.m_159["port_delay"]
  speed               = local.m_159["speed"]
  tags                = local.m_159["tags"]
}
