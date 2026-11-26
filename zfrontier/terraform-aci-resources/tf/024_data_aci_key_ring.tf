# 024 · data source aci_key_ring · 1. System and fabric setup
# Data source for ACI Key Ring
# APIC class: pkiKeyRing · DN: uni/tn-{name}/certstore/keyring-{name} | uni/userext/pkiext/keyring-{name}
# Reads models/data_aci_key_ring.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/data_aci_key_ring.yml"))["data_aci_key_ring"]
}

data "aci_key_ring" "n024" {
  name      = local.m_024["name"]
  parent_dn = local.m_024["parent_dn"]
}

output "n024_data_aci_key_ring_id" {
  value = data.aci_key_ring.n024.id
}
