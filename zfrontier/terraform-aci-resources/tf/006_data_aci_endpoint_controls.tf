# 006 · data source aci_endpoint_controls · 1. System and fabric setup
# Data source for ACI Endpoint Control
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_controls.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_aci_endpoint_controls.yml"))["data_aci_endpoint_controls"]
}

data "aci_endpoint_controls" "n006" {
  admin_st              = local.m_006["admin_st"]
  annotation            = local.m_006["annotation"]
  description           = local.m_006["description"]
  hold_intvl            = local.m_006["hold_intvl"]
  name_alias            = local.m_006["name_alias"]
  rogue_ep_detect_intvl = local.m_006["rogue_ep_detect_intvl"]
  rogue_ep_detect_mult  = local.m_006["rogue_ep_detect_mult"]
}

output "n006_data_aci_endpoint_controls_id" {
  value = data.aci_endpoint_controls.n006.id
}
