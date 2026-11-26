# 149 · resource aci_firewall_policy · 2. Access policies
# Manages ACI Firewall Policy
# APIC class: nwsFwPol · DN: uni/infra/fwP-{name}
# Reads models/aci_firewall_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_149 = yamldecode(file("${path.module}/../models/aci_firewall_policy.yml"))["aci_firewall_policy"]
}

resource "aci_firewall_policy" "n149" {
  annotation  = local.m_149["annotation"]
  annotations = local.m_149["annotations"]
  description = local.m_149["description"]
  mode        = local.m_149["mode"]
  name        = local.m_149["name"]
  name_alias  = local.m_149["name_alias"]
  owner_key   = local.m_149["owner_key"]
  owner_tag   = local.m_149["owner_tag"]
  tags        = local.m_149["tags"]
}
