# 167 · resource aci_poe_interface_policy · 2. Access policies
# Manages ACI PoE Interface Policy
# APIC class: poeIfPol · DN: uni/infra/poeIfP-{name}
# Reads models/aci_poe_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_167 = yamldecode(file("${path.module}/../models/aci_poe_interface_policy.yml"))["aci_poe_interface_policy"]
}

resource "aci_poe_interface_policy" "n167" {
  admin_state                 = local.m_167["admin_state"]
  annotation                  = local.m_167["annotation"]
  annotations                 = local.m_167["annotations"]
  description                 = local.m_167["description"]
  host_mode                   = local.m_167["host_mode"]
  maximum_power               = local.m_167["maximum_power"]
  name                        = local.m_167["name"]
  name_alias                  = local.m_167["name_alias"]
  owner_key                   = local.m_167["owner_key"]
  owner_tag                   = local.m_167["owner_tag"]
  poe_vlan                    = local.m_167["poe_vlan"]
  policing_action             = local.m_167["policing_action"]
  port_priority_high          = local.m_167["port_priority_high"]
  relation_to_application_epg = local.m_167["relation_to_application_epg"]
  tags                        = local.m_167["tags"]
}
