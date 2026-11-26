# 473 · resource aci_l3out_bfd_interface_profile · 3. Tenant and networking
# Manages ACI L3out BFD Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_bfd_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_473 = yamldecode(file("${path.module}/../models/aci_l3out_bfd_interface_profile.yml"))["aci_l3out_bfd_interface_profile"]
}

resource "aci_l3out_bfd_interface_profile" "n473" {
  annotation                   = local.m_473["annotation"]
  description                  = local.m_473["description"]
  interface_profile_type       = local.m_473["interface_profile_type"]
  key                          = local.m_473["key"]
  key_id                       = local.m_473["key_id"]
  logical_interface_profile_dn = local.m_473["logical_interface_profile_dn"]
  name_alias                   = local.m_473["name_alias"]
  relation_bfd_rs_if_pol       = local.m_473["relation_bfd_rs_if_pol"]
}
