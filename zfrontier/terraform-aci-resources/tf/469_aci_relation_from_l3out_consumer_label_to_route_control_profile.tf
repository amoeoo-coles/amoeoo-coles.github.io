# 469 · resource aci_relation_from_l3out_consumer_label_to_route_control_profile · 3. Tenant and networking
# Manages ACI Relation From L3Out Consumer Label To Route Control Profile
# APIC class: l3extRsLblToProfile · DN: uni/tn-{name}/out-{name}/conslbl-{name}/rslblToProfile-[{tDn}]-{direction}
# Reads models/aci_relation_from_l3out_consumer_label_to_route_control_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_469 = yamldecode(file("${path.module}/../models/aci_relation_from_l3out_consumer_label_to_route_control_profile.yml"))["aci_relation_from_l3out_consumer_label_to_route_control_profile"]
}

resource "aci_relation_from_l3out_consumer_label_to_route_control_profile" "n469" {
  annotation  = local.m_469["annotation"]
  annotations = local.m_469["annotations"]
  direction   = local.m_469["direction"]
  parent_dn   = local.m_469["parent_dn"]
  tags        = local.m_469["tags"]
  target_dn   = local.m_469["target_dn"]
}
