# 474 · data source aci_l3out_bfd_interface_profile · 3. Tenant and networking
# Data source for ACI L3out BFD Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_bfd_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_474 = yamldecode(file("${path.module}/../models/data_aci_l3out_bfd_interface_profile.yml"))["data_aci_l3out_bfd_interface_profile"]
}

data "aci_l3out_bfd_interface_profile" "n474" {
  annotation                   = local.m_474["annotation"]
  description                  = local.m_474["description"]
  interface_profile_type       = local.m_474["interface_profile_type"]
  key                          = local.m_474["key"]
  key_id                       = local.m_474["key_id"]
  logical_interface_profile_dn = local.m_474["logical_interface_profile_dn"]
  name_alias                   = local.m_474["name_alias"]
}

output "n474_data_aci_l3out_bfd_interface_profile_id" {
  value = data.aci_l3out_bfd_interface_profile.n474.id
}
