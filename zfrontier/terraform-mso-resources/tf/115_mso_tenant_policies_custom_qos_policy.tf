# 115 · resource mso_tenant_policies_custom_qos_policy · 10. Tenant policy templates
# Manages Custom QoS Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_custom_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/mso_tenant_policies_custom_qos_policy.yml"))["mso_tenant_policies_custom_qos_policy"]
}

resource "mso_tenant_policies_custom_qos_policy" "n115" {
  description = local.m_115["description"]
  name        = local.m_115["name"]
  template_id = local.m_115["template_id"]
  dynamic "cos_mappings" {
    for_each = local.m_115["cos_mappings"] == null ? [] : local.m_115["cos_mappings"]
    content {
      dot1p_from   = lookup(cos_mappings.value, "dot1p_from", null)
      dot1p_to     = lookup(cos_mappings.value, "dot1p_to", null)
      dscp_target  = lookup(cos_mappings.value, "dscp_target", null)
      qos_priority = lookup(cos_mappings.value, "qos_priority", null)
      target_cos   = lookup(cos_mappings.value, "target_cos", null)
    }
  }
  dynamic "dscp_mappings" {
    for_each = local.m_115["dscp_mappings"] == null ? [] : local.m_115["dscp_mappings"]
    content {
      dscp_from    = lookup(dscp_mappings.value, "dscp_from", null)
      dscp_target  = lookup(dscp_mappings.value, "dscp_target", null)
      dscp_to      = lookup(dscp_mappings.value, "dscp_to", null)
      qos_priority = lookup(dscp_mappings.value, "qos_priority", null)
      target_cos   = lookup(dscp_mappings.value, "target_cos", null)
    }
  }
}
