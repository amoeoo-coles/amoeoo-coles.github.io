# 144 · data source mso_tenant_policies_netflow_record · 10. Tenant policy templates
# Data source for NetFlow Record Policies.
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_netflow_record.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_144 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_netflow_record.yml"))["data_mso_tenant_policies_netflow_record"]
}

data "mso_tenant_policies_netflow_record" "n144" {
  name        = local.m_144["name"]
  template_id = local.m_144["template_id"]
}

output "n144_data_mso_tenant_policies_netflow_record_id" {
  value = data.mso_tenant_policies_netflow_record.n144.id
}
