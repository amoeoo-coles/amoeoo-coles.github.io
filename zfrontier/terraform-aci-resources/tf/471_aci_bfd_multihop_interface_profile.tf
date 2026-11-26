# 471 · resource aci_bfd_multihop_interface_profile · 3. Tenant and networking
# Manages ACI BFD Multihop Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_bfd_multihop_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_471 = yamldecode(file("${path.module}/../models/aci_bfd_multihop_interface_profile.yml"))["aci_bfd_multihop_interface_profile"]
}

resource "aci_bfd_multihop_interface_profile" "n471" {
  annotation                   = local.m_471["annotation"]
  description                  = local.m_471["description"]
  interface_profile_type       = local.m_471["interface_profile_type"]
  key                          = local.m_471["key"]
  key_id                       = local.m_471["key_id"]
  logical_interface_profile_dn = local.m_471["logical_interface_profile_dn"]
  name                         = local.m_471["name"]
  name_alias                   = local.m_471["name_alias"]
  relation_bfd_rs_mh_if_pol    = local.m_471["relation_bfd_rs_mh_if_pol"]
}
