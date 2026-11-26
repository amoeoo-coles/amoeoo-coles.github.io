# 052 · data source aci_radius_provider · 1. System and fabric setup
# Data source for ACI RADIUS Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_radius_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/data_aci_radius_provider.yml"))["data_aci_radius_provider"]
}

data "aci_radius_provider" "n052" {
  annotation      = local.m_052["annotation"]
  auth_port       = local.m_052["auth_port"]
  auth_protocol   = local.m_052["auth_protocol"]
  description     = local.m_052["description"]
  monitor_server  = local.m_052["monitor_server"]
  monitoring_user = local.m_052["monitoring_user"]
  name            = local.m_052["name"]
  name_alias      = local.m_052["name_alias"]
  retries         = local.m_052["retries"]
  timeout         = local.m_052["timeout"]
  type            = local.m_052["type"]
}

output "n052_data_aci_radius_provider_id" {
  value = data.aci_radius_provider.n052.id
}
