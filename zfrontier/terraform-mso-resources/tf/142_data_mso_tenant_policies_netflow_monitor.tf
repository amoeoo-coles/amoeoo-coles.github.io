# 142 · data source mso_tenant_policies_netflow_monitor · 10. Tenant policy templates
# Data source for NetFlow Monitor Policies.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_netflow_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_142 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_netflow_monitor.yml"))["data_mso_tenant_policies_netflow_monitor"]
}

data "mso_tenant_policies_netflow_monitor" "n142" {
  name        = local.m_142["name"]
  template_id = local.m_142["template_id"]
}

output "n142_data_mso_tenant_policies_netflow_monitor_id" {
  value = data.mso_tenant_policies_netflow_monitor.n142.id
}
