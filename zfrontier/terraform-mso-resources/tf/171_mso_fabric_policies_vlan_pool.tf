# 171 · resource mso_fabric_policies_vlan_pool · 11. Fabric policy and resource templates
# Manages VLAN Pools on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_vlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_171 = yamldecode(file("${path.module}/../models/mso_fabric_policies_vlan_pool.yml"))["mso_fabric_policies_vlan_pool"]
}

resource "mso_fabric_policies_vlan_pool" "n171" {
  description = local.m_171["description"]
  name        = local.m_171["name"]
  template_id = local.m_171["template_id"]
  dynamic "vlan_range" {
    for_each = local.m_171["vlan_range"] == null ? [] : local.m_171["vlan_range"]
    content {
      from = lookup(vlan_range.value, "from", null)
      to   = lookup(vlan_range.value, "to", null)
    }
  }
}
