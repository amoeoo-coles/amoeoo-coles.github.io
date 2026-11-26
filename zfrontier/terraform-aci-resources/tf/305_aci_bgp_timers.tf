# 305 · resource aci_bgp_timers · 3. Tenant and networking
# Manages ACI BGP Timers
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_305 = yamldecode(file("${path.module}/../models/aci_bgp_timers.yml"))["aci_bgp_timers"]
}

resource "aci_bgp_timers" "n305" {
  annotation   = local.m_305["annotation"]
  description  = local.m_305["description"]
  gr_ctrl      = local.m_305["gr_ctrl"]
  hold_intvl   = local.m_305["hold_intvl"]
  ka_intvl     = local.m_305["ka_intvl"]
  max_as_limit = local.m_305["max_as_limit"]
  name         = local.m_305["name"]
  name_alias   = local.m_305["name_alias"]
  stale_intvl  = local.m_305["stale_intvl"]
  tenant_dn    = local.m_305["tenant_dn"]
}
