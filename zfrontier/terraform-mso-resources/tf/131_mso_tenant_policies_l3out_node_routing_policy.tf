# 131 · resource mso_tenant_policies_l3out_node_routing_policy · 10. Tenant policy templates
# Manages L3Out Node Routing Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_l3out_node_routing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_131 = yamldecode(file("${path.module}/../models/mso_tenant_policies_l3out_node_routing_policy.yml"))["mso_tenant_policies_l3out_node_routing_policy"]
}

resource "mso_tenant_policies_l3out_node_routing_policy" "n131" {
  description = local.m_131["description"]
  name        = local.m_131["name"]
  template_id = local.m_131["template_id"]
  dynamic "bfd_multi_hop_settings" {
    for_each = local.m_131["bfd_multi_hop_settings"] == null ? [] : local.m_131["bfd_multi_hop_settings"]
    content {
      admin_state           = lookup(bfd_multi_hop_settings.value, "admin_state", null)
      detection_multiplier  = lookup(bfd_multi_hop_settings.value, "detection_multiplier", null)
      min_receive_interval  = lookup(bfd_multi_hop_settings.value, "min_receive_interval", null)
      min_transmit_interval = lookup(bfd_multi_hop_settings.value, "min_transmit_interval", null)
    }
  }
  dynamic "bgp_best_path_control" {
    for_each = local.m_131["bgp_best_path_control"] == null ? [] : local.m_131["bgp_best_path_control"]
    content {
      as_path_multipath_relax = lookup(bgp_best_path_control.value, "as_path_multipath_relax", null)
    }
  }
  dynamic "bgp_node_settings" {
    for_each = local.m_131["bgp_node_settings"] == null ? [] : local.m_131["bgp_node_settings"]
    content {
      graceful_restart_helper = lookup(bgp_node_settings.value, "graceful_restart_helper", null)
      hold_interval           = lookup(bgp_node_settings.value, "hold_interval", null)
      keep_alive_interval     = lookup(bgp_node_settings.value, "keep_alive_interval", null)
      max_as_limit            = lookup(bgp_node_settings.value, "max_as_limit", null)
      stale_interval          = lookup(bgp_node_settings.value, "stale_interval", null)
    }
  }
}
