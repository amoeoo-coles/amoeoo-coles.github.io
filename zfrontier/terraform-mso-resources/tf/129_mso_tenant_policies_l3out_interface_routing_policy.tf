# 129 · resource mso_tenant_policies_l3out_interface_routing_policy · 10. Tenant policy templates
# Manages L3Out Interface Routing Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_l3out_interface_routing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_129 = yamldecode(file("${path.module}/../models/mso_tenant_policies_l3out_interface_routing_policy.yml"))["mso_tenant_policies_l3out_interface_routing_policy"]
}

resource "mso_tenant_policies_l3out_interface_routing_policy" "n129" {
  description = local.m_129["description"]
  name        = local.m_129["name"]
  template_id = local.m_129["template_id"]
  dynamic "bfd_multi_hop_settings" {
    for_each = local.m_129["bfd_multi_hop_settings"] == null ? [] : local.m_129["bfd_multi_hop_settings"]
    content {
      admin_state           = lookup(bfd_multi_hop_settings.value, "admin_state", null)
      detection_multiplier  = lookup(bfd_multi_hop_settings.value, "detection_multiplier", null)
      min_receive_interval  = lookup(bfd_multi_hop_settings.value, "min_receive_interval", null)
      min_transmit_interval = lookup(bfd_multi_hop_settings.value, "min_transmit_interval", null)
    }
  }
  dynamic "bfd_settings" {
    for_each = local.m_129["bfd_settings"] == null ? [] : local.m_129["bfd_settings"]
    content {
      admin_state           = lookup(bfd_settings.value, "admin_state", null)
      detection_multiplier  = lookup(bfd_settings.value, "detection_multiplier", null)
      echo_admin_state      = lookup(bfd_settings.value, "echo_admin_state", null)
      echo_receive_interval = lookup(bfd_settings.value, "echo_receive_interval", null)
      interface_control     = lookup(bfd_settings.value, "interface_control", null)
      min_receive_interval  = lookup(bfd_settings.value, "min_receive_interval", null)
      min_transmit_interval = lookup(bfd_settings.value, "min_transmit_interval", null)
    }
  }
  dynamic "ospf_interface_settings" {
    for_each = local.m_129["ospf_interface_settings"] == null ? [] : local.m_129["ospf_interface_settings"]
    content {
      advertise_subnet      = lookup(ospf_interface_settings.value, "advertise_subnet", null)
      bfd                   = lookup(ospf_interface_settings.value, "bfd", null)
      cost_of_interface     = lookup(ospf_interface_settings.value, "cost_of_interface", null)
      dead_interval         = lookup(ospf_interface_settings.value, "dead_interval", null)
      hello_interval        = lookup(ospf_interface_settings.value, "hello_interval", null)
      mtu_ignore            = lookup(ospf_interface_settings.value, "mtu_ignore", null)
      network_type          = lookup(ospf_interface_settings.value, "network_type", null)
      passive_participation = lookup(ospf_interface_settings.value, "passive_participation", null)
      priority              = lookup(ospf_interface_settings.value, "priority", null)
      retransmit_interval   = lookup(ospf_interface_settings.value, "retransmit_interval", null)
      transmit_delay        = lookup(ospf_interface_settings.value, "transmit_delay", null)
    }
  }
}
