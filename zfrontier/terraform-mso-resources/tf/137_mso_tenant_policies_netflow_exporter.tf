# 137 · resource mso_tenant_policies_netflow_exporter · 10. Tenant policy templates
# Manages NetFlow Exporter Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_netflow_exporter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_137 = yamldecode(file("${path.module}/../models/mso_tenant_policies_netflow_exporter.yml"))["mso_tenant_policies_netflow_exporter"]
}

resource "mso_tenant_policies_netflow_exporter" "n137" {
  name        = local.m_137["name"]
  template_id = local.m_137["template_id"]
}
