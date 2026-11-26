# 136 · data source mso_tenant_policies_mld_snooping_policy · 10. Tenant policy templates
# Data source for MLD Snooping Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_mld_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_136 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_mld_snooping_policy.yml"))["data_mso_tenant_policies_mld_snooping_policy"]
}

data "mso_tenant_policies_mld_snooping_policy" "n136" {
  name        = local.m_136["name"]
  template_id = local.m_136["template_id"]
}

output "n136_data_mso_tenant_policies_mld_snooping_policy_id" {
  value = data.mso_tenant_policies_mld_snooping_policy.n136.id
}
