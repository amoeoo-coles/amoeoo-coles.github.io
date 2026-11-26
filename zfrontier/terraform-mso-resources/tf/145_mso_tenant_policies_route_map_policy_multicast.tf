# 145 · resource mso_tenant_policies_route_map_policy_multicast · 10. Tenant policy templates
# Manages Route Map Policies for Multicast on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_route_map_policy_multicast.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_145 = yamldecode(file("${path.module}/../models/mso_tenant_policies_route_map_policy_multicast.yml"))["mso_tenant_policies_route_map_policy_multicast"]
}

resource "mso_tenant_policies_route_map_policy_multicast" "n145" {
  description = local.m_145["description"]
  name        = local.m_145["name"]
  template_id = local.m_145["template_id"]
  dynamic "route_map_multicast_entries" {
    for_each = local.m_145["route_map_multicast_entries"] == null ? [] : local.m_145["route_map_multicast_entries"]
    content {
      action              = lookup(route_map_multicast_entries.value, "action", null)
      group_ip            = lookup(route_map_multicast_entries.value, "group_ip", null)
      order               = lookup(route_map_multicast_entries.value, "order", null)
      rendezvous_point_ip = lookup(route_map_multicast_entries.value, "rendezvous_point_ip", null)
      source_ip           = lookup(route_map_multicast_entries.value, "source_ip", null)
    }
  }
}
