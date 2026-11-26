# 009 · resource aci_endpoint_loop_protection · 1. System and fabric setup
# Manages ACI Endpoint Loop Protection
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_loop_protection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/aci_endpoint_loop_protection.yml"))["aci_endpoint_loop_protection"]
}

resource "aci_endpoint_loop_protection" "n009" {
  action            = local.m_009["action"]
  admin_st          = local.m_009["admin_st"]
  annotation        = local.m_009["annotation"]
  description       = local.m_009["description"]
  loop_detect_intvl = local.m_009["loop_detect_intvl"]
  loop_detect_mult  = local.m_009["loop_detect_mult"]
  name_alias        = local.m_009["name_alias"]
}
