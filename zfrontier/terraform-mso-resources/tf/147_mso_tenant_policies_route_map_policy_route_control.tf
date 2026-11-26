# 147 · resource mso_tenant_policies_route_map_policy_route_control · 10. Tenant policy templates
# Manages Route Map Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_route_map_policy_route_control.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_147 = yamldecode(file("${path.module}/../models/mso_tenant_policies_route_map_policy_route_control.yml"))["mso_tenant_policies_route_map_policy_route_control"]
}

resource "mso_tenant_policies_route_map_policy_route_control" "n147" {
  description = local.m_147["description"]
  match_type  = local.m_147["match_type"]
  name        = local.m_147["name"]
  template_id = local.m_147["template_id"]
}
