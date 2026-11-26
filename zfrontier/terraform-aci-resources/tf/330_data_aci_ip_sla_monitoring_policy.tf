# 330 · data source aci_ip_sla_monitoring_policy · 3. Tenant and networking
# Data source for ACI IP SLA Monitoring Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ip_sla_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_330 = yamldecode(file("${path.module}/../models/data_aci_ip_sla_monitoring_policy.yml"))["data_aci_ip_sla_monitoring_policy"]
}

data "aci_ip_sla_monitoring_policy" "n330" {
  annotation            = local.m_330["annotation"]
  description           = local.m_330["description"]
  http_uri              = local.m_330["http_uri"]
  http_version          = local.m_330["http_version"]
  name                  = local.m_330["name"]
  name_alias            = local.m_330["name_alias"]
  request_data_size     = local.m_330["request_data_size"]
  sla_detect_multiplier = local.m_330["sla_detect_multiplier"]
  sla_frequency         = local.m_330["sla_frequency"]
  sla_port              = local.m_330["sla_port"]
  sla_type              = local.m_330["sla_type"]
  tenant_dn             = local.m_330["tenant_dn"]
  threshold             = local.m_330["threshold"]
  timeout               = local.m_330["timeout"]
  traffic_class_value   = local.m_330["traffic_class_value"]
  type_of_service       = local.m_330["type_of_service"]
}

output "n330_data_aci_ip_sla_monitoring_policy_id" {
  value = data.aci_ip_sla_monitoring_policy.n330.id
}
