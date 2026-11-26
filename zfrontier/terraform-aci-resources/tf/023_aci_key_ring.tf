# 023 · resource aci_key_ring · 1. System and fabric setup
# Manages ACI Key Ring
# APIC class: pkiKeyRing · DN: uni/tn-{name}/certstore/keyring-{name} | uni/userext/pkiext/keyring-{name}
# Reads models/aci_key_ring.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/aci_key_ring.yml"))["aci_key_ring"]
}

resource "aci_key_ring" "n023" {
  admin_state           = local.m_023["admin_state"]
  annotation            = local.m_023["annotation"]
  annotations           = local.m_023["annotations"]
  certificate           = local.m_023["certificate"]
  certificate_authority = local.m_023["certificate_authority"]
  description           = local.m_023["description"]
  elliptic_curve        = local.m_023["elliptic_curve"]
  key                   = local.m_023["key"]
  key_type              = local.m_023["key_type"]
  modulus               = local.m_023["modulus"]
  name                  = local.m_023["name"]
  name_alias            = local.m_023["name_alias"]
  owner_key             = local.m_023["owner_key"]
  owner_tag             = local.m_023["owner_tag"]
  parent_dn             = local.m_023["parent_dn"]
  regenerate            = local.m_023["regenerate"]
  tags                  = local.m_023["tags"]
}
