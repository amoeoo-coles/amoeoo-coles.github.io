# 010 · data source aci_endpoint_loop_protection · 1. System and fabric setup
# Data source for ACI Endpoint Loop Protection
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_loop_protection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/data_aci_endpoint_loop_protection.yml"))["data_aci_endpoint_loop_protection"]
}

data "aci_endpoint_loop_protection" "n010" {
  action            = local.m_010["action"]
  admin_st          = local.m_010["admin_st"]
  annotation        = local.m_010["annotation"]
  description       = local.m_010["description"]
  loop_detect_intvl = local.m_010["loop_detect_intvl"]
  loop_detect_mult  = local.m_010["loop_detect_mult"]
  name_alias        = local.m_010["name_alias"]
}

output "n010_data_aci_endpoint_loop_protection_id" {
  value = data.aci_endpoint_loop_protection.n010.id
}
