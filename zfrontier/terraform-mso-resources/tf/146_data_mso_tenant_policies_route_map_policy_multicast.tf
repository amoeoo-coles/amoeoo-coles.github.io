# 146 · data source mso_tenant_policies_route_map_policy_multicast · 10. Tenant policy templates
# Data source for Route Map Policy for Multicast.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_route_map_policy_multicast.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_146 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_route_map_policy_multicast.yml"))["data_mso_tenant_policies_route_map_policy_multicast"]
}

data "mso_tenant_policies_route_map_policy_multicast" "n146" {
  name        = local.m_146["name"]
  template_id = local.m_146["template_id"]
}

output "n146_data_mso_tenant_policies_route_map_policy_multicast_id" {
  value = data.mso_tenant_policies_route_map_policy_multicast.n146.id
}
