# 122 · data source mso_tenant_policies_endpoint_mac_tag_policy · 10. Tenant policy templates
# Data source for Endpoint MAC Tag Policy on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_endpoint_mac_tag_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_122 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_endpoint_mac_tag_policy.yml"))["data_mso_tenant_policies_endpoint_mac_tag_policy"]
}

data "mso_tenant_policies_endpoint_mac_tag_policy" "n122" {
  bd_uuid     = local.m_122["bd_uuid"]
  mac         = local.m_122["mac"]
  template_id = local.m_122["template_id"]
  vrf_uuid    = local.m_122["vrf_uuid"]
}

output "n122_data_mso_tenant_policies_endpoint_mac_tag_policy_id" {
  value = data.mso_tenant_policies_endpoint_mac_tag_policy.n122.id
}
