# 490 · data source aci_l3out_node_sid_profile · 3. Tenant and networking
# Data source for ACI L3Out Node SR-MPLS Segment ID Profile
# APIC class: mplsNodeSidP · DN: uni/tn-{name}/out-{name}/lnodep-{name}/rsnodeL3OutAtt-[{tDn}]/lbp-[{addr}]/nodesidp-{sidoffset}
# Reads models/data_aci_l3out_node_sid_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_490 = yamldecode(file("${path.module}/../models/data_aci_l3out_node_sid_profile.yml"))["data_aci_l3out_node_sid_profile"]
}

data "aci_l3out_node_sid_profile" "n490" {
  parent_dn  = local.m_490["parent_dn"]
  segment_id = local.m_490["segment_id"]
}

output "n490_data_aci_l3out_node_sid_profile_id" {
  value = data.aci_l3out_node_sid_profile.n490.id
}
