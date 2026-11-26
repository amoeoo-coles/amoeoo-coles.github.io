# 014 · data source aci_isis_domain_policy · 1. System and fabric setup
# Data source for ACI ISIS Domain Policy and ISIS Level
# APIC class: not collected · DN: not collected
# Reads models/data_aci_isis_domain_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/data_aci_isis_domain_policy.yml"))["data_aci_isis_domain_policy"]
}

data "aci_isis_domain_policy" "n014" {
  annotation          = local.m_014["annotation"]
  description         = local.m_014["description"]
  isis_level_name     = local.m_014["isis_level_name"]
  isis_level_type     = local.m_014["isis_level_type"]
  lsp_fast_flood      = local.m_014["lsp_fast_flood"]
  lsp_gen_init_intvl  = local.m_014["lsp_gen_init_intvl"]
  lsp_gen_max_intvl   = local.m_014["lsp_gen_max_intvl"]
  lsp_gen_sec_intvl   = local.m_014["lsp_gen_sec_intvl"]
  mtu                 = local.m_014["mtu"]
  name_alias          = local.m_014["name_alias"]
  redistrib_metric    = local.m_014["redistrib_metric"]
  spf_comp_init_intvl = local.m_014["spf_comp_init_intvl"]
  spf_comp_max_intvl  = local.m_014["spf_comp_max_intvl"]
  spf_comp_sec_intvl  = local.m_014["spf_comp_sec_intvl"]
}

output "n014_data_aci_isis_domain_policy_id" {
  value = data.aci_isis_domain_policy.n014.id
}
