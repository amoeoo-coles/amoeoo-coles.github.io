# 143 · resource mso_tenant_policies_netflow_record · 10. Tenant policy templates
# Manages NetFlow Record Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_netflow_record.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_143 = yamldecode(file("${path.module}/../models/mso_tenant_policies_netflow_record.yml"))["mso_tenant_policies_netflow_record"]
}

resource "mso_tenant_policies_netflow_record" "n143" {
  description      = local.m_143["description"]
  match_parameters = local.m_143["match_parameters"]
  name             = local.m_143["name"]
  template_id      = local.m_143["template_id"]
}
