# 055 · resource aci_rsa_provider · 1. System and fabric setup
# Manages ACI RSA Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_rsa_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/aci_rsa_provider.yml"))["aci_rsa_provider"]
}

resource "aci_rsa_provider" "n055" {
  annotation                      = local.m_055["annotation"]
  auth_port                       = local.m_055["auth_port"]
  auth_protocol                   = local.m_055["auth_protocol"]
  description                     = local.m_055["description"]
  key                             = local.m_055["key"]
  monitor_server                  = local.m_055["monitor_server"]
  monitoring_password             = local.m_055["monitoring_password"]
  monitoring_user                 = local.m_055["monitoring_user"]
  name                            = local.m_055["name"]
  name_alias                      = local.m_055["name_alias"]
  relation_aaa_rs_prov_to_epp     = local.m_055["relation_aaa_rs_prov_to_epp"]
  relation_aaa_rs_sec_prov_to_epg = local.m_055["relation_aaa_rs_sec_prov_to_epg"]
  retries                         = local.m_055["retries"]
  timeout                         = local.m_055["timeout"]
}
