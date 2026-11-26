# 032 · resource mso_schema_template_vrf · 4. VRF
# Manages Resource for Schema Template VRF on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/mso_schema_template_vrf.yml"))["mso_schema_template_vrf"]
}

resource "mso_schema_template_vrf" "n032" {
  description                   = local.m_032["description"]
  display_name                  = local.m_032["display_name"]
  ip_data_plane_learning        = local.m_032["ip_data_plane_learning"]
  layer3_multicast              = local.m_032["layer3_multicast"]
  name                          = local.m_032["name"]
  preferred_group               = local.m_032["preferred_group"]
  schema_id                     = local.m_032["schema_id"]
  site_aware_policy_enforcement = local.m_032["site_aware_policy_enforcement"]
  template                      = local.m_032["template"]
  vzany                         = local.m_032["vzany"]
  dynamic "rendezvous_points" {
    for_each = local.m_032["rendezvous_points"] == null ? [] : local.m_032["rendezvous_points"]
    content {
      ip_address                      = lookup(rendezvous_points.value, "ip_address", null)
      route_map_policy_multicast_uuid = lookup(rendezvous_points.value, "route_map_policy_multicast_uuid", null)
      type                            = lookup(rendezvous_points.value, "type", null)
    }
  }
}
