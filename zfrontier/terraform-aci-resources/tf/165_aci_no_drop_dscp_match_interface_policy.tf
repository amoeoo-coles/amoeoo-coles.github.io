# 165 · resource aci_no_drop_dscp_match_interface_policy · 2. Access policies
# Manages ACI No-Drop-DSCP Match Interface Policy
# APIC class: qosNodropDscpMatchIfPol · DN: uni/infra/nodropDscpMatch-{name}
# Reads models/aci_no_drop_dscp_match_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_165 = yamldecode(file("${path.module}/../models/aci_no_drop_dscp_match_interface_policy.yml"))["aci_no_drop_dscp_match_interface_policy"]
}

resource "aci_no_drop_dscp_match_interface_policy" "n165" {
  admin_state = local.m_165["admin_state"]
  annotation  = local.m_165["annotation"]
  annotations = local.m_165["annotations"]
  description = local.m_165["description"]
  name        = local.m_165["name"]
  name_alias  = local.m_165["name_alias"]
  owner_key   = local.m_165["owner_key"]
  owner_tag   = local.m_165["owner_tag"]
  tags        = local.m_165["tags"]
}
