# 124 · data source mso_tenant_policies_igmp_interface_policy · 10. Tenant policy templates
# Data source for IGMP Interface Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_igmp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_124 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_igmp_interface_policy.yml"))["data_mso_tenant_policies_igmp_interface_policy"]
}

data "mso_tenant_policies_igmp_interface_policy" "n124" {
  name        = local.m_124["name"]
  template_id = local.m_124["template_id"]
}

output "n124_data_mso_tenant_policies_igmp_interface_policy_id" {
  value = data.mso_tenant_policies_igmp_interface_policy.n124.id
}
