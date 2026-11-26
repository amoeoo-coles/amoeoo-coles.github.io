# 126 · data source mso_tenant_policies_ipsla_monitoring_policy · 10. Tenant policy templates
# Data source for IPSLA Monitoring Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_ipsla_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_126 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_ipsla_monitoring_policy.yml"))["data_mso_tenant_policies_ipsla_monitoring_policy"]
}

data "mso_tenant_policies_ipsla_monitoring_policy" "n126" {
  name        = local.m_126["name"]
  template_id = local.m_126["template_id"]
}

output "n126_data_mso_tenant_policies_ipsla_monitoring_policy_id" {
  value = data.mso_tenant_policies_ipsla_monitoring_policy.n126.id
}
