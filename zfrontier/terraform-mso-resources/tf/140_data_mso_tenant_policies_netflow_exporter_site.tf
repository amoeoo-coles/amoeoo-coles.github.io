# 140 · data source mso_tenant_policies_netflow_exporter_site · 10. Tenant policy templates
# Retrieves a site-specific NetFlow Exporter configuration on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_tenant_policies_netflow_exporter_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_140 = yamldecode(file("${path.module}/../models/data_mso_tenant_policies_netflow_exporter_site.yml"))["data_mso_tenant_policies_netflow_exporter_site"]
}

data "mso_tenant_policies_netflow_exporter_site" "n140" {
  netflow_exporter_uuid = local.m_140["netflow_exporter_uuid"]
  site_id               = local.m_140["site_id"]
  template_id           = local.m_140["template_id"]
}

output "n140_data_mso_tenant_policies_netflow_exporter_site_id" {
  value = data.mso_tenant_policies_netflow_exporter_site.n140.id
}
