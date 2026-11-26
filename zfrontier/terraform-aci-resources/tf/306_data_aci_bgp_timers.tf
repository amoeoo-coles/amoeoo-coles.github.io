# 306 · data source aci_bgp_timers · 3. Tenant and networking
# Data source for ACI BGP Timers
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_306 = yamldecode(file("${path.module}/../models/data_aci_bgp_timers.yml"))["data_aci_bgp_timers"]
}

data "aci_bgp_timers" "n306" {
  annotation   = local.m_306["annotation"]
  description  = local.m_306["description"]
  gr_ctrl      = local.m_306["gr_ctrl"]
  hold_intvl   = local.m_306["hold_intvl"]
  ka_intvl     = local.m_306["ka_intvl"]
  max_as_limit = local.m_306["max_as_limit"]
  name         = local.m_306["name"]
  name_alias   = local.m_306["name_alias"]
  stale_intvl  = local.m_306["stale_intvl"]
  tenant_dn    = local.m_306["tenant_dn"]
}

output "n306_data_aci_bgp_timers_id" {
  value = data.aci_bgp_timers.n306.id
}
