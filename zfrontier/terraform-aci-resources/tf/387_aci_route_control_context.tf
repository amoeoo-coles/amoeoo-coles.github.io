# 387 · resource aci_route_control_context · 3. Tenant and networking
# Manages ACI Route Control Context
# APIC class: not collected · DN: not collected
# Reads models/aci_route_control_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_387 = yamldecode(file("${path.module}/../models/aci_route_control_context.yml"))["aci_route_control_context"]
}

resource "aci_route_control_context" "n387" {
  action                             = local.m_387["action"]
  annotation                         = local.m_387["annotation"]
  description                        = local.m_387["description"]
  name                               = local.m_387["name"]
  name_alias                         = local.m_387["name_alias"]
  order                              = local.m_387["order"]
  relation_rtctrl_rs_ctx_p_to_subj_p = local.m_387["relation_rtctrl_rs_ctx_p_to_subj_p"]
  route_control_profile_dn           = local.m_387["route_control_profile_dn"]
  set_rule                           = local.m_387["set_rule"]
}
