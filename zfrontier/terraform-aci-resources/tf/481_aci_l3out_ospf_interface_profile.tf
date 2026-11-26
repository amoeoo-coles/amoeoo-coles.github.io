# 481 · resource aci_l3out_ospf_interface_profile · 3. Tenant and networking
# Manages ACI L3out OSPF Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_ospf_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_481 = yamldecode(file("${path.module}/../models/aci_l3out_ospf_interface_profile.yml"))["aci_l3out_ospf_interface_profile"]
}

resource "aci_l3out_ospf_interface_profile" "n481" {
  annotation                   = local.m_481["annotation"]
  auth_key                     = local.m_481["auth_key"]
  auth_key_id                  = local.m_481["auth_key_id"]
  auth_type                    = local.m_481["auth_type"]
  description                  = local.m_481["description"]
  logical_interface_profile_dn = local.m_481["logical_interface_profile_dn"]
  name_alias                   = local.m_481["name_alias"]
  relation_ospf_rs_if_pol      = local.m_481["relation_ospf_rs_if_pol"]
}
