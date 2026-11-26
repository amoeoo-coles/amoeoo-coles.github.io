# 356 · data source aci_ospf_timers · 3. Tenant and networking
# Data source for ACI OSPF Timers
# APIC class: not collected · DN: not collected
# Reads models/data_aci_ospf_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_356 = yamldecode(file("${path.module}/../models/data_aci_ospf_timers.yml"))["data_aci_ospf_timers"]
}

data "aci_ospf_timers" "n356" {
  annotation          = local.m_356["annotation"]
  bw_ref              = local.m_356["bw_ref"]
  ctrl                = local.m_356["ctrl"]
  description         = local.m_356["description"]
  dist                = local.m_356["dist"]
  gr_ctrl             = local.m_356["gr_ctrl"]
  lsa_arrival_intvl   = local.m_356["lsa_arrival_intvl"]
  lsa_gp_pacing_intvl = local.m_356["lsa_gp_pacing_intvl"]
  lsa_hold_intvl      = local.m_356["lsa_hold_intvl"]
  lsa_max_intvl       = local.m_356["lsa_max_intvl"]
  lsa_start_intvl     = local.m_356["lsa_start_intvl"]
  max_ecmp            = local.m_356["max_ecmp"]
  max_lsa_action      = local.m_356["max_lsa_action"]
  max_lsa_num         = local.m_356["max_lsa_num"]
  max_lsa_reset_intvl = local.m_356["max_lsa_reset_intvl"]
  max_lsa_sleep_cnt   = local.m_356["max_lsa_sleep_cnt"]
  max_lsa_sleep_intvl = local.m_356["max_lsa_sleep_intvl"]
  max_lsa_thresh      = local.m_356["max_lsa_thresh"]
  name                = local.m_356["name"]
  name_alias          = local.m_356["name_alias"]
  spf_hold_intvl      = local.m_356["spf_hold_intvl"]
  spf_init_intvl      = local.m_356["spf_init_intvl"]
  spf_max_intvl       = local.m_356["spf_max_intvl"]
  tenant_dn           = local.m_356["tenant_dn"]
}

output "n356_data_aci_ospf_timers_id" {
  value = data.aci_ospf_timers.n356.id
}
