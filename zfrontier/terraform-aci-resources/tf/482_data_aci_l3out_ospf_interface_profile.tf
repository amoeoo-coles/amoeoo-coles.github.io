# 482 · data source aci_l3out_ospf_interface_profile · 3. Tenant and networking
# Data source for ACI L3out OSPF Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_ospf_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_482 = yamldecode(file("${path.module}/../models/data_aci_l3out_ospf_interface_profile.yml"))["data_aci_l3out_ospf_interface_profile"]
}

data "aci_l3out_ospf_interface_profile" "n482" {
  annotation                   = local.m_482["annotation"]
  auth_key                     = local.m_482["auth_key"]
  auth_key_id                  = local.m_482["auth_key_id"]
  auth_type                    = local.m_482["auth_type"]
  description                  = local.m_482["description"]
  logical_interface_profile_dn = local.m_482["logical_interface_profile_dn"]
  name_alias                   = local.m_482["name_alias"]
}

output "n482_data_aci_l3out_ospf_interface_profile_id" {
  value = data.aci_l3out_ospf_interface_profile.n482.id
}
