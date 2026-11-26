# 125 · resource mso_tenant_policies_ipsla_monitoring_policy · 10. Tenant policy templates
# Manages IPSLA Monitoring Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_ipsla_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_125 = yamldecode(file("${path.module}/../models/mso_tenant_policies_ipsla_monitoring_policy.yml"))["mso_tenant_policies_ipsla_monitoring_policy"]
}

resource "mso_tenant_policies_ipsla_monitoring_policy" "n125" {
  description        = local.m_125["description"]
  destination_port   = local.m_125["destination_port"]
  detect_multiplier  = local.m_125["detect_multiplier"]
  http_uri           = local.m_125["http_uri"]
  http_version       = local.m_125["http_version"]
  ipv6_traffic_class = local.m_125["ipv6_traffic_class"]
  name               = local.m_125["name"]
  operation_timeout  = local.m_125["operation_timeout"]
  request_data_size  = local.m_125["request_data_size"]
  sla_frequency      = local.m_125["sla_frequency"]
  sla_type           = local.m_125["sla_type"]
  template_id        = local.m_125["template_id"]
  threshold          = local.m_125["threshold"]
  type_of_service    = local.m_125["type_of_service"]
}
