# 545 · data source aci_relation_to_static_leaf · 4. Application
# Data source for ACI Relation To Static Leaf
# APIC class: fvRsNodeAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsnodeAtt-[{tDn}]
# Reads models/data_aci_relation_to_static_leaf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_545 = yamldecode(file("${path.module}/../models/data_aci_relation_to_static_leaf.yml"))["data_aci_relation_to_static_leaf"]
}

data "aci_relation_to_static_leaf" "n545" {
  parent_dn = local.m_545["parent_dn"]
  target_dn = local.m_545["target_dn"]
}

output "n545_data_aci_relation_to_static_leaf_id" {
  value = data.aci_relation_to_static_leaf.n545.id
}
