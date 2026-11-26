# 357 · resource aci_pim_interface_policy · 3. Tenant and networking
# Manages ACI PIM Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_pim_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_357 = yamldecode(file("${path.module}/../models/aci_pim_interface_policy.yml"))["aci_pim_interface_policy"]
}

resource "aci_pim_interface_policy" "n357" {
  annotation                        = local.m_357["annotation"]
  auth_key                          = local.m_357["auth_key"]
  auth_type                         = local.m_357["auth_type"]
  control_state                     = local.m_357["control_state"]
  description                       = local.m_357["description"]
  designated_router_delay           = local.m_357["designated_router_delay"]
  designated_router_priority        = local.m_357["designated_router_priority"]
  hello_interval                    = local.m_357["hello_interval"]
  inbound_join_prune_filter_policy  = local.m_357["inbound_join_prune_filter_policy"]
  join_prune_interval               = local.m_357["join_prune_interval"]
  name                              = local.m_357["name"]
  name_alias                        = local.m_357["name_alias"]
  neighbor_filter_policy            = local.m_357["neighbor_filter_policy"]
  outbound_join_prune_filter_policy = local.m_357["outbound_join_prune_filter_policy"]
  tenant_dn                         = local.m_357["tenant_dn"]
}
