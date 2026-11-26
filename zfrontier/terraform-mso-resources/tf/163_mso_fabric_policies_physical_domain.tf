# 163 · resource mso_fabric_policies_physical_domain · 11. Fabric policy and resource templates
# Manages Physical Domains on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_physical_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_163 = yamldecode(file("${path.module}/../models/mso_fabric_policies_physical_domain.yml"))["mso_fabric_policies_physical_domain"]
}

resource "mso_fabric_policies_physical_domain" "n163" {
  description    = local.m_163["description"]
  name           = local.m_163["name"]
  template_id    = local.m_163["template_id"]
  vlan_pool_uuid = local.m_163["vlan_pool_uuid"]
}
