# 544 · resource aci_relation_to_static_leaf · 4. Application
# Manages ACI Relation To Static Leaf
# APIC class: fvRsNodeAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsnodeAtt-[{tDn}]
# Reads models/aci_relation_to_static_leaf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_544 = yamldecode(file("${path.module}/../models/aci_relation_to_static_leaf.yml"))["aci_relation_to_static_leaf"]
}

resource "aci_relation_to_static_leaf" "n544" {
  annotation           = local.m_544["annotation"]
  annotations          = local.m_544["annotations"]
  deployment_immediacy = local.m_544["deployment_immediacy"]
  description          = local.m_544["description"]
  encapsulation        = local.m_544["encapsulation"]
  mode                 = local.m_544["mode"]
  parent_dn            = local.m_544["parent_dn"]
  tags                 = local.m_544["tags"]
  target_dn            = local.m_544["target_dn"]
}
