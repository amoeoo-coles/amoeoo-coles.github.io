# 293 · resource aci_bfd_multihop_interface_policy · 3. Tenant and networking
# Manages ACI BFD Multihop Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_bfd_multihop_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_293 = yamldecode(file("${path.module}/../models/aci_bfd_multihop_interface_policy.yml"))["aci_bfd_multihop_interface_policy"]
}

resource "aci_bfd_multihop_interface_policy" "n293" {
  admin_state           = local.m_293["admin_state"]
  annotation            = local.m_293["annotation"]
  description           = local.m_293["description"]
  detection_multiplier  = local.m_293["detection_multiplier"]
  min_receive_interval  = local.m_293["min_receive_interval"]
  min_transmit_interval = local.m_293["min_transmit_interval"]
  name                  = local.m_293["name"]
  name_alias            = local.m_293["name_alias"]
  tenant_dn             = local.m_293["tenant_dn"]
}
