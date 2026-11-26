# 161 · resource aci_lldp_interface_policy · 2. Access policies
# Manages ACI LLDP Interface Policy
# APIC class: lldpIfPol · DN: uni/infra/lldpIfP-{name}
# Reads models/aci_lldp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_161 = yamldecode(file("${path.module}/../models/aci_lldp_interface_policy.yml"))["aci_lldp_interface_policy"]
}

resource "aci_lldp_interface_policy" "n161" {
  admin_rx_st    = local.m_161["admin_rx_st"]
  admin_tx_st    = local.m_161["admin_tx_st"]
  annotation     = local.m_161["annotation"]
  annotations    = local.m_161["annotations"]
  dcbxp_version  = local.m_161["dcbxp_version"]
  description    = local.m_161["description"]
  name           = local.m_161["name"]
  name_alias     = local.m_161["name_alias"]
  owner_key      = local.m_161["owner_key"]
  owner_tag      = local.m_161["owner_tag"]
  receive_state  = local.m_161["receive_state"]
  tags           = local.m_161["tags"]
  transmit_state = local.m_161["transmit_state"]
}
