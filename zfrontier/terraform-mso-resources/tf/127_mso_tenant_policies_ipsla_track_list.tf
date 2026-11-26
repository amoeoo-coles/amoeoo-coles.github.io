# 127 · resource mso_tenant_policies_ipsla_track_list · 10. Tenant policy templates
# Manages IPSLA Track List on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_ipsla_track_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_127 = yamldecode(file("${path.module}/../models/mso_tenant_policies_ipsla_track_list.yml"))["mso_tenant_policies_ipsla_track_list"]
}

resource "mso_tenant_policies_ipsla_track_list" "n127" {
  description    = local.m_127["description"]
  name           = local.m_127["name"]
  template_id    = local.m_127["template_id"]
  threshold_down = local.m_127["threshold_down"]
  threshold_up   = local.m_127["threshold_up"]
  type           = local.m_127["type"]
  dynamic "members" {
    for_each = local.m_127["members"] == null ? [] : local.m_127["members"]
    content {
      destination_ip               = lookup(members.value, "destination_ip", null)
      ipsla_monitoring_policy_uuid = lookup(members.value, "ipsla_monitoring_policy_uuid", null)
      scope_type                   = lookup(members.value, "scope_type", null)
      scope_uuid                   = lookup(members.value, "scope_uuid", null)
    }
  }
}
