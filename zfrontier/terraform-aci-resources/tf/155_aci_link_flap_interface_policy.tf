# 155 · resource aci_link_flap_interface_policy · 2. Access policies
# Manages ACI Link Flap Interface Policy
# APIC class: fabricLinkFlapPol · DN: uni/infra/linkflappol-{name}
# Reads models/aci_link_flap_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_155 = yamldecode(file("${path.module}/../models/aci_link_flap_interface_policy.yml"))["aci_link_flap_interface_policy"]
}

resource "aci_link_flap_interface_policy" "n155" {
  allowed_time_for_flaps = local.m_155["allowed_time_for_flaps"]
  annotation             = local.m_155["annotation"]
  annotations            = local.m_155["annotations"]
  description            = local.m_155["description"]
  maximum_flaps          = local.m_155["maximum_flaps"]
  name                   = local.m_155["name"]
  name_alias             = local.m_155["name_alias"]
  owner_key              = local.m_155["owner_key"]
  owner_tag              = local.m_155["owner_tag"]
  tags                   = local.m_155["tags"]
}
