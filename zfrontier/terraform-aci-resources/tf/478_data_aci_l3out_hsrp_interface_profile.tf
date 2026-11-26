# 478 · data source aci_l3out_hsrp_interface_profile · 3. Tenant and networking
# Data source for ACI L3-out HSRP interface profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_hsrp_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_478 = yamldecode(file("${path.module}/../models/data_aci_l3out_hsrp_interface_profile.yml"))["data_aci_l3out_hsrp_interface_profile"]
}

data "aci_l3out_hsrp_interface_profile" "n478" {
  annotation                   = local.m_478["annotation"]
  description                  = local.m_478["description"]
  logical_interface_profile_dn = local.m_478["logical_interface_profile_dn"]
  name_alias                   = local.m_478["name_alias"]
  version                      = local.m_478["version"]
}

output "n478_data_aci_l3out_hsrp_interface_profile_id" {
  value = data.aci_l3out_hsrp_interface_profile.n478.id
}
