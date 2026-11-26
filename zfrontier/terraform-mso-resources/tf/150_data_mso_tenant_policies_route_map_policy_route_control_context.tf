# 150 · data source mso_tenant_policies_route_map_policy_route_control_context · 10. Tenant policy templates
# Data source for Route Map Policy Route Control Context.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_route_map_policy_route_control_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_150 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_route_map_policy_route_control_context.yml"))["data_mso_tenant_policies_route_map_policy_route_control_context"]
}

data "mso_tenant_policies_route_map_policy_route_control_context" "n150" {
  name                  = local.m_150["name"]
  route_map_policy_uuid = local.m_150["route_map_policy_uuid"]
  template_id           = local.m_150["template_id"]
}

output "n150_data_mso_tenant_policies_route_map_policy_route_control_context_id" {
  value = data.mso_tenant_policies_route_map_policy_route_control_context.n150.id
}
