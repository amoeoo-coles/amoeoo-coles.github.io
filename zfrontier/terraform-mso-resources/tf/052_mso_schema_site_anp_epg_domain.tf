# 052 · resource mso_schema_site_anp_epg_domain · 6. ANP and EPG
# Manages MSO Schema Site Application Network Profiles Endpoint Groups Domain.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_anp_epg_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_052 = yamldecode(file("${path.module}/../models/mso_schema_site_anp_epg_domain.yml"))["mso_schema_site_anp_epg_domain"]
}

resource "mso_schema_site_anp_epg_domain" "n052" {
  allow_micro_segmentation = local.m_052["allow_micro_segmentation"]
  allow_promiscuous        = local.m_052["allow_promiscuous"]
  anp_name                 = local.m_052["anp_name"]
  binding_type             = local.m_052["binding_type"]
  custom_epg_name          = local.m_052["custom_epg_name"]
  delimiter                = local.m_052["delimiter"]
  deploy_immediacy         = local.m_052["deploy_immediacy"]
  dn                       = local.m_052["dn"]
  domain_dn                = local.m_052["domain_dn"]
  domain_name              = local.m_052["domain_name"]
  domain_type              = local.m_052["domain_type"]
  enhanced_lag_policy_dn   = local.m_052["enhanced_lag_policy_dn"]
  enhanced_lag_policy_name = local.m_052["enhanced_lag_policy_name"]
  epg_name                 = local.m_052["epg_name"]
  forged_transmits         = local.m_052["forged_transmits"]
  mac_changes              = local.m_052["mac_changes"]
  micro_seg_vlan           = local.m_052["micro_seg_vlan"]
  micro_seg_vlan_type      = local.m_052["micro_seg_vlan_type"]
  netflow                  = local.m_052["netflow"]
  num_ports                = local.m_052["num_ports"]
  port_allocation          = local.m_052["port_allocation"]
  port_encap_vlan          = local.m_052["port_encap_vlan"]
  port_encap_vlan_type     = local.m_052["port_encap_vlan_type"]
  resolution_immediacy     = local.m_052["resolution_immediacy"]
  schema_id                = local.m_052["schema_id"]
  site_id                  = local.m_052["site_id"]
  switch_type              = local.m_052["switch_type"]
  switching_mode           = local.m_052["switching_mode"]
  template_name            = local.m_052["template_name"]
  vlan_encap_mode          = local.m_052["vlan_encap_mode"]
  vmm_domain_type          = local.m_052["vmm_domain_type"]
}
