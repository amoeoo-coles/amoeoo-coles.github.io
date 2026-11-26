# 066 · resource aci_tacacs_provider · 1. System and fabric setup
# Manages ACI TACACS Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_tacacs_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/aci_tacacs_provider.yml"))["aci_tacacs_provider"]
}

resource "aci_tacacs_provider" "n066" {
  annotation                      = local.m_066["annotation"]
  auth_protocol                   = local.m_066["auth_protocol"]
  description                     = local.m_066["description"]
  key                             = local.m_066["key"]
  monitor_server                  = local.m_066["monitor_server"]
  monitoring_password             = local.m_066["monitoring_password"]
  monitoring_user                 = local.m_066["monitoring_user"]
  name                            = local.m_066["name"]
  name_alias                      = local.m_066["name_alias"]
  port                            = local.m_066["port"]
  relation_aaa_rs_prov_to_epp     = local.m_066["relation_aaa_rs_prov_to_epp"]
  relation_aaa_rs_sec_prov_to_epg = local.m_066["relation_aaa_rs_sec_prov_to_epg"]
  retries                         = local.m_066["retries"]
  timeout                         = local.m_066["timeout"]
}
