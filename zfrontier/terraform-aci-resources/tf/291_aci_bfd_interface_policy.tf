# 291 · resource aci_bfd_interface_policy · 3. Tenant and networking
# Manages ACI BFD Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_bfd_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_291 = yamldecode(file("${path.module}/../models/aci_bfd_interface_policy.yml"))["aci_bfd_interface_policy"]
}

resource "aci_bfd_interface_policy" "n291" {
  admin_st      = local.m_291["admin_st"]
  annotation    = local.m_291["annotation"]
  ctrl          = local.m_291["ctrl"]
  description   = local.m_291["description"]
  detect_mult   = local.m_291["detect_mult"]
  echo_admin_st = local.m_291["echo_admin_st"]
  echo_rx_intvl = local.m_291["echo_rx_intvl"]
  min_rx_intvl  = local.m_291["min_rx_intvl"]
  min_tx_intvl  = local.m_291["min_tx_intvl"]
  name          = local.m_291["name"]
  name_alias    = local.m_291["name_alias"]
  tenant_dn     = local.m_291["tenant_dn"]
}
