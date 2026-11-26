# 153 · resource mso_fabric_policies_interface_setting · 11. Fabric policy and resource templates
# Manages Interface Settings on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_interface_setting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_153 = yamldecode(file("${path.module}/../models/mso_fabric_policies_interface_setting.yml"))["mso_fabric_policies_interface_setting"]
}

resource "mso_fabric_policies_interface_setting" "n153" {
  access_macsec_policy_uuid       = local.m_153["access_macsec_policy_uuid"]
  auto_negotiation                = local.m_153["auto_negotiation"]
  cdp_admin_state                 = local.m_153["cdp_admin_state"]
  controls                        = local.m_153["controls"]
  description                     = local.m_153["description"]
  domain_uuids                    = local.m_153["domain_uuids"]
  l2_interface_qinq               = local.m_153["l2_interface_qinq"]
  l2_interface_reflective_relay   = local.m_153["l2_interface_reflective_relay"]
  link_level_bring_up_delay       = local.m_153["link_level_bring_up_delay"]
  link_level_debounce_interval    = local.m_153["link_level_debounce_interval"]
  link_level_fec                  = local.m_153["link_level_fec"]
  lldp_receive_state              = local.m_153["lldp_receive_state"]
  lldp_transmit_state             = local.m_153["lldp_transmit_state"]
  llfc_receive_state              = local.m_153["llfc_receive_state"]
  llfc_transmit_state             = local.m_153["llfc_transmit_state"]
  load_balance_hashing            = local.m_153["load_balance_hashing"]
  mcp_admin_state                 = local.m_153["mcp_admin_state"]
  mcp_grace_period_msec           = local.m_153["mcp_grace_period_msec"]
  mcp_grace_period_sec            = local.m_153["mcp_grace_period_sec"]
  mcp_initial_delay_time          = local.m_153["mcp_initial_delay_time"]
  mcp_strict_mode                 = local.m_153["mcp_strict_mode"]
  mcp_transmission_frequency_msec = local.m_153["mcp_transmission_frequency_msec"]
  mcp_transmission_frequency_sec  = local.m_153["mcp_transmission_frequency_sec"]
  name                            = local.m_153["name"]
  pfc_admin_state                 = local.m_153["pfc_admin_state"]
  port_channel_max_links          = local.m_153["port_channel_max_links"]
  port_channel_min_links          = local.m_153["port_channel_min_links"]
  port_channel_mode               = local.m_153["port_channel_mode"]
  speed                           = local.m_153["speed"]
  stp_bpdu_filter                 = local.m_153["stp_bpdu_filter"]
  stp_bpdu_guard                  = local.m_153["stp_bpdu_guard"]
  synce_uuid                      = local.m_153["synce_uuid"]
  template_id                     = local.m_153["template_id"]
  type                            = local.m_153["type"]
  vlan_scope                      = local.m_153["vlan_scope"]
}
