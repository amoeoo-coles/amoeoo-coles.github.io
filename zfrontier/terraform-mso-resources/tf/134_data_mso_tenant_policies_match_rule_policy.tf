# 134 · data source mso_tenant_policies_match_rule_policy · 10. Tenant policy templates
# Reads Match Rule Policies on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_match_rule_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_134 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_match_rule_policy.yml"))["data_mso_tenant_policies_match_rule_policy"]
}

data "mso_tenant_policies_match_rule_policy" "n134" {
  name        = local.m_134["name"]
  template_id = local.m_134["template_id"]
}

output "n134_data_mso_tenant_policies_match_rule_policy_id" {
  value = data.mso_tenant_policies_match_rule_policy.n134.id
}
