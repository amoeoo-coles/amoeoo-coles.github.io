# 013 · resource aci_isis_domain_policy · 1. System and fabric setup
# Manages ACI ISIS Domain Policy and ISIS Level
# APIC class: not collected · DN: not collected
# Reads models/aci_isis_domain_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/aci_isis_domain_policy.yml"))["aci_isis_domain_policy"]
}

resource "aci_isis_domain_policy" "n013" {
  annotation          = local.m_013["annotation"]
  description         = local.m_013["description"]
  isis_level_name     = local.m_013["isis_level_name"]
  isis_level_type     = local.m_013["isis_level_type"]
  lsp_fast_flood      = local.m_013["lsp_fast_flood"]
  lsp_gen_init_intvl  = local.m_013["lsp_gen_init_intvl"]
  lsp_gen_max_intvl   = local.m_013["lsp_gen_max_intvl"]
  lsp_gen_sec_intvl   = local.m_013["lsp_gen_sec_intvl"]
  mtu                 = local.m_013["mtu"]
  name_alias          = local.m_013["name_alias"]
  redistrib_metric    = local.m_013["redistrib_metric"]
  spf_comp_init_intvl = local.m_013["spf_comp_init_intvl"]
  spf_comp_max_intvl  = local.m_013["spf_comp_max_intvl"]
  spf_comp_sec_intvl  = local.m_013["spf_comp_sec_intvl"]
}
