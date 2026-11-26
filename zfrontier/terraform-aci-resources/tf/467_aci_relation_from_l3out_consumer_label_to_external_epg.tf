# 467 · resource aci_relation_from_l3out_consumer_label_to_external_epg · 3. Tenant and networking
# Manages ACI Relation From L3Out Consumer Label To External EPG
# APIC class: l3extRsLblToInstP · DN: uni/tn-{name}/out-{name}/conslbl-{name}/rslblToInstP-[{tDn}]
# Reads models/aci_relation_from_l3out_consumer_label_to_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_467 = yamldecode(file("${path.module}/../models/aci_relation_from_l3out_consumer_label_to_external_epg.yml"))["aci_relation_from_l3out_consumer_label_to_external_epg"]
}

resource "aci_relation_from_l3out_consumer_label_to_external_epg" "n467" {
  annotation  = local.m_467["annotation"]
  annotations = local.m_467["annotations"]
  parent_dn   = local.m_467["parent_dn"]
  tags        = local.m_467["tags"]
  target_dn   = local.m_467["target_dn"]
}
