# 005 · resource aci_endpoint_controls · 1. System and fabric setup
# Manages ACI Endpoint Control
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_controls.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/aci_endpoint_controls.yml"))["aci_endpoint_controls"]
}

resource "aci_endpoint_controls" "n005" {
  admin_st              = local.m_005["admin_st"]
  annotation            = local.m_005["annotation"]
  description           = local.m_005["description"]
  hold_intvl            = local.m_005["hold_intvl"]
  name_alias            = local.m_005["name_alias"]
  rogue_ep_detect_intvl = local.m_005["rogue_ep_detect_intvl"]
  rogue_ep_detect_mult  = local.m_005["rogue_ep_detect_mult"]
}
