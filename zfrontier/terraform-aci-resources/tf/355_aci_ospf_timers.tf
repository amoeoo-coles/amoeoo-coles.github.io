# 355 · resource aci_ospf_timers · 3. Tenant and networking
# Manages ACI OSPF Timers
# APIC class: not collected · DN: not collected
# Reads models/aci_ospf_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_355 = yamldecode(file("${path.module}/../models/aci_ospf_timers.yml"))["aci_ospf_timers"]
}

resource "aci_ospf_timers" "n355" {
  annotation          = local.m_355["annotation"]
  bw_ref              = local.m_355["bw_ref"]
  ctrl                = local.m_355["ctrl"]
  description         = local.m_355["description"]
  dist                = local.m_355["dist"]
  gr_ctrl             = local.m_355["gr_ctrl"]
  lsa_arrival_intvl   = local.m_355["lsa_arrival_intvl"]
  lsa_gp_pacing_intvl = local.m_355["lsa_gp_pacing_intvl"]
  lsa_hold_intvl      = local.m_355["lsa_hold_intvl"]
  lsa_max_intvl       = local.m_355["lsa_max_intvl"]
  lsa_start_intvl     = local.m_355["lsa_start_intvl"]
  max_ecmp            = local.m_355["max_ecmp"]
  max_lsa_action      = local.m_355["max_lsa_action"]
  max_lsa_num         = local.m_355["max_lsa_num"]
  max_lsa_reset_intvl = local.m_355["max_lsa_reset_intvl"]
  max_lsa_sleep_cnt   = local.m_355["max_lsa_sleep_cnt"]
  max_lsa_sleep_intvl = local.m_355["max_lsa_sleep_intvl"]
  max_lsa_thresh      = local.m_355["max_lsa_thresh"]
  name                = local.m_355["name"]
  name_alias          = local.m_355["name_alias"]
  spf_hold_intvl      = local.m_355["spf_hold_intvl"]
  spf_init_intvl      = local.m_355["spf_init_intvl"]
  spf_max_intvl       = local.m_355["spf_max_intvl"]
  tenant_dn           = local.m_355["tenant_dn"]
}
