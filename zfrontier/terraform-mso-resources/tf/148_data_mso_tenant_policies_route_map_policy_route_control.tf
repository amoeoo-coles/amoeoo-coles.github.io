# 148 · data source mso_tenant_policies_route_map_policy_route_control · 10. Tenant policy templates
# Data source for Route Map Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_route_map_policy_route_control.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_148 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_route_map_policy_route_control.yml"))["data_mso_tenant_policies_route_map_policy_route_control"]
}

data "mso_tenant_policies_route_map_policy_route_control" "n148" {
  name        = local.m_148["name"]
  template_id = local.m_148["template_id"]
}

output "n148_data_mso_tenant_policies_route_map_policy_route_control_id" {
  value = data.mso_tenant_policies_route_map_policy_route_control.n148.id
}
