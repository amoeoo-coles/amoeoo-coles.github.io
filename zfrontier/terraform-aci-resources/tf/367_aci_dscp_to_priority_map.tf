# 367 · resource aci_dscp_to_priority_map · 3. Tenant and networking
# Manages ACI DSCP to Priority Map
# APIC class: qosDscpClass · DN: uni/tn-{name}/qoscustom-{name}/dcsp-{from}-{to}
# Reads models/aci_dscp_to_priority_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_367 = yamldecode(file("${path.module}/../models/aci_dscp_to_priority_map.yml"))["aci_dscp_to_priority_map"]
}

resource "aci_dscp_to_priority_map" "n367" {
  annotation  = local.m_367["annotation"]
  annotations = local.m_367["annotations"]
  description = local.m_367["description"]
  from        = local.m_367["from"]
  name        = local.m_367["name"]
  name_alias  = local.m_367["name_alias"]
  parent_dn   = local.m_367["parent_dn"]
  priority    = local.m_367["priority"]
  tags        = local.m_367["tags"]
  target      = local.m_367["target"]
  target_cos  = local.m_367["target_cos"]
  to          = local.m_367["to"]
}
