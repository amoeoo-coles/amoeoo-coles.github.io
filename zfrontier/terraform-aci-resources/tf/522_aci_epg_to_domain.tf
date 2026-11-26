# 522 · resource aci_epg_to_domain · 4. Application
# Manages ACI epg to Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_epg_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_522 = yamldecode(file("${path.module}/../models/aci_epg_to_domain.yml"))["aci_epg_to_domain"]
}

resource "aci_epg_to_domain" "n522" {
  allow_micro_seg       = local.m_522["allow_micro_seg"]
  annotation            = local.m_522["annotation"]
  application_epg_dn    = local.m_522["application_epg_dn"]
  binding_type          = local.m_522["binding_type"]
  custom_epg_name       = local.m_522["custom_epg_name"]
  delimiter             = local.m_522["delimiter"]
  encap                 = local.m_522["encap"]
  encap_mode            = local.m_522["encap_mode"]
  enhanced_lag_policy   = local.m_522["enhanced_lag_policy"]
  epg_cos               = local.m_522["epg_cos"]
  epg_cos_pref          = local.m_522["epg_cos_pref"]
  instr_imedcy          = local.m_522["instr_imedcy"]
  lag_policy_name       = local.m_522["lag_policy_name"]
  netflow_dir           = local.m_522["netflow_dir"]
  netflow_pref          = local.m_522["netflow_pref"]
  num_ports             = local.m_522["num_ports"]
  port_allocation       = local.m_522["port_allocation"]
  primary_encap         = local.m_522["primary_encap"]
  primary_encap_inner   = local.m_522["primary_encap_inner"]
  res_imedcy            = local.m_522["res_imedcy"]
  secondary_encap_inner = local.m_522["secondary_encap_inner"]
  switching_mode        = local.m_522["switching_mode"]
  tdn                   = local.m_522["tdn"]
  vmm_allow_promiscuous = local.m_522["vmm_allow_promiscuous"]
  vmm_forged_transmits  = local.m_522["vmm_forged_transmits"]
  vmm_mac_changes       = local.m_522["vmm_mac_changes"]
}
