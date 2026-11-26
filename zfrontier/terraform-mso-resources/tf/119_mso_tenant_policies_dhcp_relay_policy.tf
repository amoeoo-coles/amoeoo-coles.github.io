# 119 · resource mso_tenant_policies_dhcp_relay_policy · 10. Tenant policy templates
# Manages DHCP Relay Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_dhcp_relay_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_119 = yamldecode(file("${path.module}/../models/mso_tenant_policies_dhcp_relay_policy.yml"))["mso_tenant_policies_dhcp_relay_policy"]
}

resource "mso_tenant_policies_dhcp_relay_policy" "n119" {
  description = local.m_119["description"]
  name        = local.m_119["name"]
  template_id = local.m_119["template_id"]
  dynamic "dhcp_relay_providers" {
    for_each = local.m_119["dhcp_relay_providers"] == null ? [] : local.m_119["dhcp_relay_providers"]
    content {
      application_epg_uuid       = lookup(dhcp_relay_providers.value, "application_epg_uuid", null)
      dhcp_server_address        = lookup(dhcp_relay_providers.value, "dhcp_server_address", null)
      dhcp_server_vrf_preference = lookup(dhcp_relay_providers.value, "dhcp_server_vrf_preference", null)
      external_epg_uuid          = lookup(dhcp_relay_providers.value, "external_epg_uuid", null)
    }
  }
}
