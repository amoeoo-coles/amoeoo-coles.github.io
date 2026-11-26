# 138 · data source mso_tenant_policies_netflow_exporter · 10. Tenant policy templates
# Data source for NetFlow Exporter Policies.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_netflow_exporter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_138 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_netflow_exporter.yml"))["data_mso_tenant_policies_netflow_exporter"]
}

data "mso_tenant_policies_netflow_exporter" "n138" {
  name        = local.m_138["name"]
  template_id = local.m_138["template_id"]
}

output "n138_data_mso_tenant_policies_netflow_exporter_id" {
  value = data.mso_tenant_policies_netflow_exporter.n138.id
}
