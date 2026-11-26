# 472 · data source aci_bfd_multihop_interface_profile · 3. Tenant and networking
# Data source for ACI BFD Multihop Interface Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bfd_multihop_interface_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_472 = yamldecode(file("${path.module}/../models/data_aci_bfd_multihop_interface_profile.yml"))["data_aci_bfd_multihop_interface_profile"]
}

data "aci_bfd_multihop_interface_profile" "n472" {
  annotation                   = local.m_472["annotation"]
  description                  = local.m_472["description"]
  logical_interface_profile_dn = local.m_472["logical_interface_profile_dn"]
  name_alias                   = local.m_472["name_alias"]
}

output "n472_data_aci_bfd_multihop_interface_profile_id" {
  value = data.aci_bfd_multihop_interface_profile.n472.id
}
