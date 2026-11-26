# 498 · data source aci_l3out_hsrp_secondary_vip · 3. Tenant and networking
# Data source for ACI L3out HSRP Secondary VIP
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_hsrp_secondary_vip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_498 = yamldecode(file("${path.module}/../models/data_aci_l3out_hsrp_secondary_vip.yml"))["data_aci_l3out_hsrp_secondary_vip"]
}

data "aci_l3out_hsrp_secondary_vip" "n498" {
  annotation                    = local.m_498["annotation"]
  config_issues                 = local.m_498["config_issues"]
  description                   = local.m_498["description"]
  ip                            = local.m_498["ip"]
  l3out_hsrp_interface_group_dn = local.m_498["l3out_hsrp_interface_group_dn"]
  name_alias                    = local.m_498["name_alias"]
}

output "n498_data_aci_l3out_hsrp_secondary_vip_id" {
  value = data.aci_l3out_hsrp_secondary_vip.n498.id
}
