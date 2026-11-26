# 487 · resource aci_l3out_hsrp_interface_group · 3. Tenant and networking
# Manages ACI L3out HSRP Interface Group
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_hsrp_interface_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_487 = yamldecode(file("${path.module}/../models/aci_l3out_hsrp_interface_group.yml"))["aci_l3out_hsrp_interface_group"]
}

resource "aci_l3out_hsrp_interface_group" "n487" {
  annotation                      = local.m_487["annotation"]
  config_issues                   = local.m_487["config_issues"]
  description                     = local.m_487["description"]
  group_af                        = local.m_487["group_af"]
  group_id                        = local.m_487["group_id"]
  group_name                      = local.m_487["group_name"]
  ip                              = local.m_487["ip"]
  ip_obtain_mode                  = local.m_487["ip_obtain_mode"]
  l3out_hsrp_interface_profile_dn = local.m_487["l3out_hsrp_interface_profile_dn"]
  mac                             = local.m_487["mac"]
  name                            = local.m_487["name"]
  name_alias                      = local.m_487["name_alias"]
  relation_hsrp_rs_group_pol      = local.m_487["relation_hsrp_rs_group_pol"]
}
