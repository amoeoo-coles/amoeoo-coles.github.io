# 315 · resource aci_end_point_retention_policy · 3. Tenant and networking
# Manages ACI End Point Retention Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_end_point_retention_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_315 = yamldecode(file("${path.module}/../models/aci_end_point_retention_policy.yml"))["aci_end_point_retention_policy"]
}

resource "aci_end_point_retention_policy" "n315" {
  annotation          = local.m_315["annotation"]
  bounce_age_intvl    = local.m_315["bounce_age_intvl"]
  bounce_trig         = local.m_315["bounce_trig"]
  description         = local.m_315["description"]
  hold_intvl          = local.m_315["hold_intvl"]
  local_ep_age_intvl  = local.m_315["local_ep_age_intvl"]
  move_freq           = local.m_315["move_freq"]
  name                = local.m_315["name"]
  name_alias          = local.m_315["name_alias"]
  remote_ep_age_intvl = local.m_315["remote_ep_age_intvl"]
  tenant_dn           = local.m_315["tenant_dn"]
}
