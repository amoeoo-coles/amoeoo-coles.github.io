# 497 · resource aci_l3out_hsrp_secondary_vip · 3. Tenant and networking
# Manages ACI L3out HSRP Secondary VIP
# APIC class: not collected · DN: not collected
# Reads models/aci_l3out_hsrp_secondary_vip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_497 = yamldecode(file("${path.module}/../models/aci_l3out_hsrp_secondary_vip.yml"))["aci_l3out_hsrp_secondary_vip"]
}

resource "aci_l3out_hsrp_secondary_vip" "n497" {
  annotation                    = local.m_497["annotation"]
  config_issues                 = local.m_497["config_issues"]
  description                   = local.m_497["description"]
  ip                            = local.m_497["ip"]
  l3out_hsrp_interface_group_dn = local.m_497["l3out_hsrp_interface_group_dn"]
  name_alias                    = local.m_497["name_alias"]
}
