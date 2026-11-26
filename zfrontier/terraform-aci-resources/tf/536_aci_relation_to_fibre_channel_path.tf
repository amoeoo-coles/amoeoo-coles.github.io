# 536 · resource aci_relation_to_fibre_channel_path · 4. Application
# Manages ACI Relation To Fibre Channel Path
# APIC class: fvRsFcPathAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsfcPathAtt-[{tDn}]
# Reads models/aci_relation_to_fibre_channel_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_536 = yamldecode(file("${path.module}/../models/aci_relation_to_fibre_channel_path.yml"))["aci_relation_to_fibre_channel_path"]
}

resource "aci_relation_to_fibre_channel_path" "n536" {
  annotation  = local.m_536["annotation"]
  annotations = local.m_536["annotations"]
  description = local.m_536["description"]
  parent_dn   = local.m_536["parent_dn"]
  tags        = local.m_536["tags"]
  target_dn   = local.m_536["target_dn"]
  vsan        = local.m_536["vsan"]
  vsan_mode   = local.m_536["vsan_mode"]
}
