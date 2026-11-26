# 617 · resource aci_fabric_external_connection_policy · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Fabric External Connection Policy
# APIC class: fvFabricExtConnP · DN: uni/tn-{name}/fabricExtConnP-{id}
# Reads models/aci_fabric_external_connection_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_617 = yamldecode(file("${path.module}/../models/aci_fabric_external_connection_policy.yml"))["aci_fabric_external_connection_policy"]
}

resource "aci_fabric_external_connection_policy" "n617" {
  annotation      = local.m_617["annotation"]
  annotations     = local.m_617["annotations"]
  community       = local.m_617["community"]
  description     = local.m_617["description"]
  fabric_id       = local.m_617["fabric_id"]
  name            = local.m_617["name"]
  name_alias      = local.m_617["name_alias"]
  owner_key       = local.m_617["owner_key"]
  owner_tag       = local.m_617["owner_tag"]
  parent_dn       = local.m_617["parent_dn"]
  peering_profile = local.m_617["peering_profile"]
  site_id         = local.m_617["site_id"]
  tags            = local.m_617["tags"]
}
