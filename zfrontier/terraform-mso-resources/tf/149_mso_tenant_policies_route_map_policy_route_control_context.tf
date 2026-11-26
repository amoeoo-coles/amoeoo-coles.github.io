# 149 · resource mso_tenant_policies_route_map_policy_route_control_context · 10. Tenant policy templates
# Manages Route Map Policy Route Control Contexts on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_route_map_policy_route_control_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_149 = yamldecode(file("${path.module}/../models/mso_tenant_policies_route_map_policy_route_control_context.yml"))["mso_tenant_policies_route_map_policy_route_control_context"]
}

resource "mso_tenant_policies_route_map_policy_route_control_context" "n149" {
  action                = local.m_149["action"]
  description           = local.m_149["description"]
  match_rule_uuids      = local.m_149["match_rule_uuids"]
  name                  = local.m_149["name"]
  order                 = local.m_149["order"]
  route_map_policy_uuid = local.m_149["route_map_policy_uuid"]
  set_rule_uuid         = local.m_149["set_rule_uuid"]
  template_id           = local.m_149["template_id"]
}
