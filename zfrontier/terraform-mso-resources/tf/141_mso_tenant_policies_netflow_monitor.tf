# 141 · resource mso_tenant_policies_netflow_monitor · 10. Tenant policy templates
# Manages NetFlow Monitor Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_netflow_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_141 = yamldecode(file("${path.module}/../models/mso_tenant_policies_netflow_monitor.yml"))["mso_tenant_policies_netflow_monitor"]
}

resource "mso_tenant_policies_netflow_monitor" "n141" {
  description            = local.m_141["description"]
  name                   = local.m_141["name"]
  netflow_exporter_uuids = local.m_141["netflow_exporter_uuids"]
  netflow_record_uuid    = local.m_141["netflow_record_uuid"]
  template_id            = local.m_141["template_id"]
}
