# 132 · data source mso_tenant_policies_l3out_node_routing_policy · 10. Tenant policy templates
# Data source for L3Out Node Routing Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_l3out_node_routing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_132 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_l3out_node_routing_policy.yml"))["data_mso_tenant_policies_l3out_node_routing_policy"]
}

data "mso_tenant_policies_l3out_node_routing_policy" "n132" {
  name        = local.m_132["name"]
  template_id = local.m_132["template_id"]
}

output "n132_data_mso_tenant_policies_l3out_node_routing_policy_id" {
  value = data.mso_tenant_policies_l3out_node_routing_policy.n132.id
}
