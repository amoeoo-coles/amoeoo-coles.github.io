# 046 ndfc_fabric_ipfm — 8. Other
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/fabric_ipfm
# Reads ../models/ndfc_fabric_ipfm.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_fabric_ipfm = yamldecode(file("${path.module}/../models/ndfc_fabric_ipfm.yml"))["ndfc_fabric_ipfm"]
}

resource "ndfc_fabric_ipfm" "this" {
  aaa_remote_ip_enabled     = local.ndfc_fabric_ipfm.aaa_remote_ip_enabled
  aaa_server_conf           = local.ndfc_fabric_ipfm.aaa_server_conf
  active_migration          = local.ndfc_fabric_ipfm.active_migration
  agent_intf                = local.ndfc_fabric_ipfm.agent_intf
  asm_group_ranges          = local.ndfc_fabric_ipfm.asm_group_ranges
  bootstrap_conf            = local.ndfc_fabric_ipfm.bootstrap_conf
  bootstrap_enable          = local.ndfc_fabric_ipfm.bootstrap_enable
  bootstrap_multisubnet     = local.ndfc_fabric_ipfm.bootstrap_multisubnet
  brfield_debug_flag        = local.ndfc_fabric_ipfm.brfield_debug_flag
  cdp_enable                = local.ndfc_fabric_ipfm.cdp_enable
  deploy                    = local.ndfc_fabric_ipfm.deploy
  deployment_freeze         = local.ndfc_fabric_ipfm.deployment_freeze
  dhcp_enable               = local.ndfc_fabric_ipfm.dhcp_enable
  dhcp_end                  = local.ndfc_fabric_ipfm.dhcp_end
  dhcp_ipv6_enable          = local.ndfc_fabric_ipfm.dhcp_ipv6_enable
  dhcp_start                = local.ndfc_fabric_ipfm.dhcp_start
  dns_server_ip_list        = local.ndfc_fabric_ipfm.dns_server_ip_list
  dns_server_vrf            = local.ndfc_fabric_ipfm.dns_server_vrf
  enable_aaa                = local.ndfc_fabric_ipfm.enable_aaa
  enable_agent              = local.ndfc_fabric_ipfm.enable_agent
  enable_asm                = local.ndfc_fabric_ipfm.enable_asm
  enable_nbm_passive        = local.ndfc_fabric_ipfm.enable_nbm_passive
  enable_nxapi              = local.ndfc_fabric_ipfm.enable_nxapi
  enable_nxapi_http         = local.ndfc_fabric_ipfm.enable_nxapi_http
  enable_rt_intf_stats      = local.ndfc_fabric_ipfm.enable_rt_intf_stats
  ext_fabric_type           = local.ndfc_fabric_ipfm.ext_fabric_type
  extra_conf_intra_links    = local.ndfc_fabric_ipfm.extra_conf_intra_links
  extra_conf_leaf           = local.ndfc_fabric_ipfm.extra_conf_leaf
  extra_conf_spine          = local.ndfc_fabric_ipfm.extra_conf_spine
  fabric_mtu                = local.ndfc_fabric_ipfm.fabric_mtu
  fabric_name               = local.ndfc_fabric_ipfm.fabric_name
  feature_ptp               = local.ndfc_fabric_ipfm.feature_ptp
  ff                        = local.ndfc_fabric_ipfm.ff
  grfield_debug_flag        = local.ndfc_fabric_ipfm.grfield_debug_flag
  intf_stat_load_interval   = local.ndfc_fabric_ipfm.intf_stat_load_interval
  isis_auth_enable          = local.ndfc_fabric_ipfm.isis_auth_enable
  isis_auth_key             = local.ndfc_fabric_ipfm.isis_auth_key
  isis_auth_keychain_key_id = local.ndfc_fabric_ipfm.isis_auth_keychain_key_id
  isis_auth_keychain_name   = local.ndfc_fabric_ipfm.isis_auth_keychain_name
  isis_level                = local.ndfc_fabric_ipfm.isis_level
  isis_p2p_enable           = local.ndfc_fabric_ipfm.isis_p2p_enable
  l2_host_intf_mtu          = local.ndfc_fabric_ipfm.l2_host_intf_mtu
  link_state_routing        = local.ndfc_fabric_ipfm.link_state_routing
  link_state_routing_tag    = local.ndfc_fabric_ipfm.link_state_routing_tag
  loopback0_ip_range        = local.ndfc_fabric_ipfm.loopback0_ip_range
  mgmt_gw                   = local.ndfc_fabric_ipfm.mgmt_gw
  mgmt_prefix               = local.ndfc_fabric_ipfm.mgmt_prefix
  ntp_server_ip_list        = local.ndfc_fabric_ipfm.ntp_server_ip_list
  ntp_server_vrf            = local.ndfc_fabric_ipfm.ntp_server_vrf
  nxapi_http_port           = local.ndfc_fabric_ipfm.nxapi_http_port
  nxapi_https_port          = local.ndfc_fabric_ipfm.nxapi_https_port
  nxapi_vrf                 = local.ndfc_fabric_ipfm.nxapi_vrf
  ospf_area_id              = local.ndfc_fabric_ipfm.ospf_area_id
  ospf_auth_enable          = local.ndfc_fabric_ipfm.ospf_auth_enable
  ospf_auth_key             = local.ndfc_fabric_ipfm.ospf_auth_key
  ospf_auth_key_id          = local.ndfc_fabric_ipfm.ospf_auth_key_id
  pim_hello_auth_enable     = local.ndfc_fabric_ipfm.pim_hello_auth_enable
  pim_hello_auth_key        = local.ndfc_fabric_ipfm.pim_hello_auth_key
  pm_enable                 = local.ndfc_fabric_ipfm.pm_enable
  power_redundancy_mode     = local.ndfc_fabric_ipfm.power_redundancy_mode
  ptp_domain_id             = local.ndfc_fabric_ipfm.ptp_domain_id
  ptp_lb_id                 = local.ndfc_fabric_ipfm.ptp_lb_id
  ptp_profile               = local.ndfc_fabric_ipfm.ptp_profile
  replication_mode          = local.ndfc_fabric_ipfm.replication_mode
  routing_lb_id             = local.ndfc_fabric_ipfm.routing_lb_id
  rp_ip_range               = local.ndfc_fabric_ipfm.rp_ip_range
  rp_lb_id                  = local.ndfc_fabric_ipfm.rp_lb_id
  snmp_server_host_trap     = local.ndfc_fabric_ipfm.snmp_server_host_trap
  static_underlay_ip_alloc  = local.ndfc_fabric_ipfm.static_underlay_ip_alloc
  subnet_range              = local.ndfc_fabric_ipfm.subnet_range
  subnet_target_mask        = local.ndfc_fabric_ipfm.subnet_target_mask
  syslog_server_ip_list     = local.ndfc_fabric_ipfm.syslog_server_ip_list
  syslog_server_vrf         = local.ndfc_fabric_ipfm.syslog_server_vrf
  syslog_sev                = local.ndfc_fabric_ipfm.syslog_sev
}
