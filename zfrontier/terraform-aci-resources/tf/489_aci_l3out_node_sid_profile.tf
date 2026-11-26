# 489 · resource aci_l3out_node_sid_profile · 3. Tenant and networking
# Manages ACI L3Out Node SR-MPLS Segment ID Profile
# APIC class: mplsNodeSidP · DN: uni/tn-{name}/out-{name}/lnodep-{name}/rsnodeL3OutAtt-[{tDn}]/lbp-[{addr}]/nodesidp-{sidoffset}
# Reads models/aci_l3out_node_sid_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_489 = yamldecode(file("${path.module}/../models/aci_l3out_node_sid_profile.yml"))["aci_l3out_node_sid_profile"]
}

resource "aci_l3out_node_sid_profile" "n489" {
  annotation       = local.m_489["annotation"]
  annotations      = local.m_489["annotations"]
  description      = local.m_489["description"]
  loopback_address = local.m_489["loopback_address"]
  name             = local.m_489["name"]
  name_alias       = local.m_489["name_alias"]
  parent_dn        = local.m_489["parent_dn"]
  segment_id       = local.m_489["segment_id"]
  tags             = local.m_489["tags"]
}
