# 130 · data source mso_tenant_policies_l3out_interface_routing_policy · 10. Tenant policy templates
# Data source for L3Out Interface Routing Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_l3out_interface_routing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_130 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_l3out_interface_routing_policy.yml"))["data_mso_tenant_policies_l3out_interface_routing_policy"]
}

data "mso_tenant_policies_l3out_interface_routing_policy" "n130" {
  name        = local.m_130["name"]
  template_id = local.m_130["template_id"]
}

output "n130_data_mso_tenant_policies_l3out_interface_routing_policy_id" {
  value = data.mso_tenant_policies_l3out_interface_routing_policy.n130.id
}
