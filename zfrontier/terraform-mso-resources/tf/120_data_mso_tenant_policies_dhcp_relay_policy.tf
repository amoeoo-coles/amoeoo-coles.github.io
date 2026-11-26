# 120 · data source mso_tenant_policies_dhcp_relay_policy · 10. Tenant policy templates
# Data source for DHCP Relay Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_dhcp_relay_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_120 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_dhcp_relay_policy.yml"))["data_mso_tenant_policies_dhcp_relay_policy"]
}

data "mso_tenant_policies_dhcp_relay_policy" "n120" {
  name        = local.m_120["name"]
  template_id = local.m_120["template_id"]
}

output "n120_data_mso_tenant_policies_dhcp_relay_policy_id" {
  value = data.mso_tenant_policies_dhcp_relay_policy.n120.id
}
