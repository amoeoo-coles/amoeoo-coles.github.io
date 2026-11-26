# 155 · resource mso_fabric_policies_l3_domain · 11. Fabric policy and resource templates
# Manages L3 Domains on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_l3_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_155 = yamldecode(file("${path.module}/../models/mso_fabric_policies_l3_domain.yml"))["mso_fabric_policies_l3_domain"]
}

resource "mso_fabric_policies_l3_domain" "n155" {
  description    = local.m_155["description"]
  name           = local.m_155["name"]
  template_id    = local.m_155["template_id"]
  vlan_pool_uuid = local.m_155["vlan_pool_uuid"]
}
