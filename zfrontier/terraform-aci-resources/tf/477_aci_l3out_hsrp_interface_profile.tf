# 477 · resource aci_l3out_hsrp_interface_profile · 3. Tenant and networking
# Manages ACI L3-out HSRP interface profile
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_hsrp_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_477 = yamldecode(file("${path.module}/../models/aci_l3out_hsrp_interface_profile.yml"))["aci_l3out_hsrp_interface_profile"]
}

resource "aci_l3out_hsrp_interface_profile" "n477" {
  annotation                   = local.m_477["annotation"]
  description                  = local.m_477["description"]
  logical_interface_profile_dn = local.m_477["logical_interface_profile_dn"]
  name_alias                   = local.m_477["name_alias"]
  relation_hsrp_rs_if_pol      = local.m_477["relation_hsrp_rs_if_pol"]
  version                      = local.m_477["version"]
}
