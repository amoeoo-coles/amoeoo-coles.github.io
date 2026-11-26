# 295 · resource aci_bfd_multihop_node_policy · 3. Tenant and networking
# Manages ACI BFD Multihop Node Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_bfd_multihop_node_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_295 = yamldecode(file("${path.module}/../models/aci_bfd_multihop_node_policy.yml"))["aci_bfd_multihop_node_policy"]
}

resource "aci_bfd_multihop_node_policy" "n295" {
  admin_state          = local.m_295["admin_state"]
  annotation           = local.m_295["annotation"]
  description          = local.m_295["description"]
  detection_multiplier = local.m_295["detection_multiplier"]
  min_rx_interval      = local.m_295["min_rx_interval"]
  min_tx_interval      = local.m_295["min_tx_interval"]
  name                 = local.m_295["name"]
  name_alias           = local.m_295["name_alias"]
  tenant_dn            = local.m_295["tenant_dn"]
}
