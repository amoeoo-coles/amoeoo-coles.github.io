# 116 · data source mso_tenant_policies_custom_qos_policy · 10. Tenant policy templates
# Data source for Custom QoS Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_custom_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_custom_qos_policy.yml"))["data_mso_tenant_policies_custom_qos_policy"]
}

data "mso_tenant_policies_custom_qos_policy" "n116" {
  name        = local.m_116["name"]
  template_id = local.m_116["template_id"]
}

output "n116_data_mso_tenant_policies_custom_qos_policy_id" {
  value = data.mso_tenant_policies_custom_qos_policy.n116.id
}
