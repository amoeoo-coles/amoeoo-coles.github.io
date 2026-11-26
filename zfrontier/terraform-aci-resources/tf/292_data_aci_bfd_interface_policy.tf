# 292 · data source aci_bfd_interface_policy · 3. Tenant and networking
# Data source for ACI BFD Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bfd_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_292 = yamldecode(file("${path.module}/../models/data_aci_bfd_interface_policy.yml"))["data_aci_bfd_interface_policy"]
}

data "aci_bfd_interface_policy" "n292" {
  admin_st      = local.m_292["admin_st"]
  annotation    = local.m_292["annotation"]
  ctrl          = local.m_292["ctrl"]
  description   = local.m_292["description"]
  detect_mult   = local.m_292["detect_mult"]
  echo_admin_st = local.m_292["echo_admin_st"]
  echo_rx_intvl = local.m_292["echo_rx_intvl"]
  min_rx_intvl  = local.m_292["min_rx_intvl"]
  min_tx_intvl  = local.m_292["min_tx_intvl"]
  name          = local.m_292["name"]
  name_alias    = local.m_292["name_alias"]
  tenant_dn     = local.m_292["tenant_dn"]
}

output "n292_data_aci_bfd_interface_policy_id" {
  value = data.aci_bfd_interface_policy.n292.id
}
