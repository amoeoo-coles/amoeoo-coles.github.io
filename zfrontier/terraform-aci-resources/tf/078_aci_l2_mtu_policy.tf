# 078 · resource aci_l2_mtu_policy · 1. System and fabric setup
# Manages ACI L2 MTU Policy
# APIC class: l2InstPol · DN: uni/fabric/l2pol-{name}
# Reads models/aci_l2_mtu_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/aci_l2_mtu_policy.yml"))["aci_l2_mtu_policy"]
}

resource "aci_l2_mtu_policy" "n078" {
  annotation     = local.m_078["annotation"]
  annotations    = local.m_078["annotations"]
  description    = local.m_078["description"]
  fabric_mtu     = local.m_078["fabric_mtu"]
  management_mtu = local.m_078["management_mtu"]
  name           = local.m_078["name"]
  name_alias     = local.m_078["name_alias"]
  owner_key      = local.m_078["owner_key"]
  owner_tag      = local.m_078["owner_tag"]
  tags           = local.m_078["tags"]
}
