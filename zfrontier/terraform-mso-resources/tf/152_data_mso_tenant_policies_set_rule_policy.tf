# 152 · data source mso_tenant_policies_set_rule_policy · 10. Tenant policy templates
# Reads Set Rule Policies on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_set_rule_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_152 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_set_rule_policy.yml"))["data_mso_tenant_policies_set_rule_policy"]
}

data "mso_tenant_policies_set_rule_policy" "n152" {
  name        = local.m_152["name"]
  template_id = local.m_152["template_id"]
}

output "n152_data_mso_tenant_policies_set_rule_policy_id" {
  value = data.mso_tenant_policies_set_rule_policy.n152.id
}
