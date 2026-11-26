# 476 · data source aci_l3out_floating_svi · 3. Tenant and networking
# Data source for ACI L3out Floating SVI
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_floating_svi.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_476 = yamldecode(file("${path.module}/../models/data_aci_l3out_floating_svi.yml"))["data_aci_l3out_floating_svi"]
}

data "aci_l3out_floating_svi" "n476" {
  annotation                   = local.m_476["annotation"]
  description                  = local.m_476["description"]
  encap                        = local.m_476["encap"]
  logical_interface_profile_dn = local.m_476["logical_interface_profile_dn"]
  node_dn                      = local.m_476["node_dn"]
}

output "n476_data_aci_l3out_floating_svi_id" {
  value = data.aci_l3out_floating_svi.n476.id
}
