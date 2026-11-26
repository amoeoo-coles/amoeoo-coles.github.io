# 051 · resource aci_radius_provider · 1. System and fabric setup
# Manages ACI RADIUS Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_radius_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/aci_radius_provider.yml"))["aci_radius_provider"]
}

resource "aci_radius_provider" "n051" {
  annotation                      = local.m_051["annotation"]
  auth_port                       = local.m_051["auth_port"]
  auth_protocol                   = local.m_051["auth_protocol"]
  description                     = local.m_051["description"]
  key                             = local.m_051["key"]
  monitor_server                  = local.m_051["monitor_server"]
  monitoring_password             = local.m_051["monitoring_password"]
  monitoring_user                 = local.m_051["monitoring_user"]
  name                            = local.m_051["name"]
  name_alias                      = local.m_051["name_alias"]
  relation_aaa_rs_prov_to_epp     = local.m_051["relation_aaa_rs_prov_to_epp"]
  relation_aaa_rs_sec_prov_to_epg = local.m_051["relation_aaa_rs_sec_prov_to_epg"]
  retries                         = local.m_051["retries"]
  timeout                         = local.m_051["timeout"]
  type                            = local.m_051["type"]
}
