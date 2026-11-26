# 523 · data source aci_epg_to_domain · 4. Application
# Data source for ACI epg to Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_epg_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_523 = yamldecode(file("${path.module}/../models/data_aci_epg_to_domain.yml"))["data_aci_epg_to_domain"]
}

data "aci_epg_to_domain" "n523" {
  allow_micro_seg       = local.m_523["allow_micro_seg"]
  annotation            = local.m_523["annotation"]
  application_epg_dn    = local.m_523["application_epg_dn"]
  binding_type          = local.m_523["binding_type"]
  custom_epg_name       = local.m_523["custom_epg_name"]
  delimiter             = local.m_523["delimiter"]
  encap                 = local.m_523["encap"]
  encap_mode            = local.m_523["encap_mode"]
  enhanced_lag_policy   = local.m_523["enhanced_lag_policy"]
  epg_cos               = local.m_523["epg_cos"]
  epg_cos_pref          = local.m_523["epg_cos_pref"]
  instr_imedcy          = local.m_523["instr_imedcy"]
  lag_policy_name       = local.m_523["lag_policy_name"]
  netflow_dir           = local.m_523["netflow_dir"]
  netflow_pref          = local.m_523["netflow_pref"]
  num_ports             = local.m_523["num_ports"]
  port_allocation       = local.m_523["port_allocation"]
  primary_encap         = local.m_523["primary_encap"]
  primary_encap_inner   = local.m_523["primary_encap_inner"]
  res_imedcy            = local.m_523["res_imedcy"]
  secondary_encap_inner = local.m_523["secondary_encap_inner"]
  switching_mode        = local.m_523["switching_mode"]
  tdn                   = local.m_523["tdn"]
}

output "n523_data_aci_epg_to_domain_id" {
  value = data.aci_epg_to_domain.n523.id
}
