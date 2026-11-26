# 042 · resource mso_schema_template_bd · 5. Bridge domains
# Manages MSO Schema Template Bridge Domain.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_bd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_042 = yamldecode(file("${path.module}/../models/mso_schema_template_bd.yml"))["mso_schema_template_bd"]
}

resource "mso_schema_template_bd" "n042" {
  arp_flooding                    = local.m_042["arp_flooding"]
  description                     = local.m_042["description"]
  dhcp_policy                     = local.m_042["dhcp_policy"]
  display_name                    = local.m_042["display_name"]
  ep_move_detection_mode          = local.m_042["ep_move_detection_mode"]
  intersite_bum_traffic           = local.m_042["intersite_bum_traffic"]
  ipv6_unknown_multicast_flooding = local.m_042["ipv6_unknown_multicast_flooding"]
  layer2_stretch                  = local.m_042["layer2_stretch"]
  layer2_unknown_unicast          = local.m_042["layer2_unknown_unicast"]
  layer3_multicast                = local.m_042["layer3_multicast"]
  multi_destination_flooding      = local.m_042["multi_destination_flooding"]
  name                            = local.m_042["name"]
  optimize_wan_bandwidth          = local.m_042["optimize_wan_bandwidth"]
  schema_id                       = local.m_042["schema_id"]
  template_name                   = local.m_042["template_name"]
  unicast_routing                 = local.m_042["unicast_routing"]
  unknown_multicast_flooding      = local.m_042["unknown_multicast_flooding"]
  virtual_mac_address             = local.m_042["virtual_mac_address"]
  vrf_name                        = local.m_042["vrf_name"]
  vrf_schema_id                   = local.m_042["vrf_schema_id"]
  vrf_template_name               = local.m_042["vrf_template_name"]
  dynamic "dhcp_policies" {
    for_each = local.m_042["dhcp_policies"] == null ? [] : local.m_042["dhcp_policies"]
    content {
      dhcp_option_policy_name    = lookup(dhcp_policies.value, "dhcp_option_policy_name", null)
      dhcp_option_policy_version = lookup(dhcp_policies.value, "dhcp_option_policy_version", null)
      name                       = lookup(dhcp_policies.value, "name", null)
      version                    = lookup(dhcp_policies.value, "version", null)
    }
  }
}
