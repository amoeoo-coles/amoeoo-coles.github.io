# 329 · resource aci_ip_sla_monitoring_policy · 3. Tenant and networking
# Manages ACI IP SLA Monitoring Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_ip_sla_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_329 = yamldecode(file("${path.module}/../models/aci_ip_sla_monitoring_policy.yml"))["aci_ip_sla_monitoring_policy"]
}

resource "aci_ip_sla_monitoring_policy" "n329" {
  annotation            = local.m_329["annotation"]
  description           = local.m_329["description"]
  http_uri              = local.m_329["http_uri"]
  http_version          = local.m_329["http_version"]
  name                  = local.m_329["name"]
  name_alias            = local.m_329["name_alias"]
  request_data_size     = local.m_329["request_data_size"]
  sla_detect_multiplier = local.m_329["sla_detect_multiplier"]
  sla_frequency         = local.m_329["sla_frequency"]
  sla_port              = local.m_329["sla_port"]
  sla_type              = local.m_329["sla_type"]
  tenant_dn             = local.m_329["tenant_dn"]
  threshold             = local.m_329["threshold"]
  timeout               = local.m_329["timeout"]
  traffic_class_value   = local.m_329["traffic_class_value"]
  type_of_service       = local.m_329["type_of_service"]
}
