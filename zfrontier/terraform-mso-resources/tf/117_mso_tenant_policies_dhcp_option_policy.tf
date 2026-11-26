# 117 · resource mso_tenant_policies_dhcp_option_policy · 10. Tenant policy templates
# Manages DHCP Option Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_dhcp_option_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_117 = yamldecode(file("${path.module}/../models/mso_tenant_policies_dhcp_option_policy.yml"))["mso_tenant_policies_dhcp_option_policy"]
}

resource "mso_tenant_policies_dhcp_option_policy" "n117" {
  description = local.m_117["description"]
  name        = local.m_117["name"]
  template_id = local.m_117["template_id"]
  dynamic "options" {
    for_each = local.m_117["options"] == null ? [] : local.m_117["options"]
    content {
      data = lookup(options.value, "data", null)
      name = lookup(options.value, "name", null)
    }
  }
}
