# 118 · data source mso_tenant_policies_dhcp_option_policy · 10. Tenant policy templates
# Data source for DHCP Option Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_dhcp_option_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_118 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_dhcp_option_policy.yml"))["data_mso_tenant_policies_dhcp_option_policy"]
}

data "mso_tenant_policies_dhcp_option_policy" "n118" {
  name        = local.m_118["name"]
  template_id = local.m_118["template_id"]
}

output "n118_data_mso_tenant_policies_dhcp_option_policy_id" {
  value = data.mso_tenant_policies_dhcp_option_policy.n118.id
}
