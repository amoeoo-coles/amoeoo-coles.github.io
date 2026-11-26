# 067 · data source aci_tacacs_provider · 1. System and fabric setup
# Data source for ACI TACACS Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tacacs_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/data_aci_tacacs_provider.yml"))["data_aci_tacacs_provider"]
}

data "aci_tacacs_provider" "n067" {
  annotation      = local.m_067["annotation"]
  auth_protocol   = local.m_067["auth_protocol"]
  description     = local.m_067["description"]
  monitor_server  = local.m_067["monitor_server"]
  monitoring_user = local.m_067["monitoring_user"]
  name            = local.m_067["name"]
  name_alias      = local.m_067["name_alias"]
  port            = local.m_067["port"]
  retries         = local.m_067["retries"]
  timeout         = local.m_067["timeout"]
}

output "n067_data_aci_tacacs_provider_id" {
  value = data.aci_tacacs_provider.n067.id
}
