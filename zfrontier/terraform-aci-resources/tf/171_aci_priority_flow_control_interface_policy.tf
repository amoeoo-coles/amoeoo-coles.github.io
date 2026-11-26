# 171 · resource aci_priority_flow_control_interface_policy · 2. Access policies
# Manages ACI Priority Flow Control Interface Policy
# APIC class: qosPfcIfPol · DN: uni/infra/pfc-{name}
# Reads models/aci_priority_flow_control_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_171 = yamldecode(file("${path.module}/../models/aci_priority_flow_control_interface_policy.yml"))["aci_priority_flow_control_interface_policy"]
}

resource "aci_priority_flow_control_interface_policy" "n171" {
  annotation  = local.m_171["annotation"]
  annotations = local.m_171["annotations"]
  description = local.m_171["description"]
  name        = local.m_171["name"]
  name_alias  = local.m_171["name_alias"]
  owner_key   = local.m_171["owner_key"]
  owner_tag   = local.m_171["owner_tag"]
  state       = local.m_171["state"]
  tags        = local.m_171["tags"]
}
