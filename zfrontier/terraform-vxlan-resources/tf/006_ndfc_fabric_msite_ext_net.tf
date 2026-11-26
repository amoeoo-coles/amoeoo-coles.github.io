# 006 ndfc_fabric_msite_ext_net — 1. Global, fabric and features
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/fabric_msite_ext_net
# Reads ../models/ndfc_fabric_msite_ext_net.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_fabric_msite_ext_net = yamldecode(file("${path.module}/../models/ndfc_fabric_msite_ext_net.yml"))["ndfc_fabric_msite_ext_net"]
}

resource "ndfc_fabric_msite_ext_net" "this" {
  aaa_remote_ip_enabled   = local.ndfc_fabric_msite_ext_net.aaa_remote_ip_enabled
  aaa_server_conf         = local.ndfc_fabric_msite_ext_net.aaa_server_conf
  allow_nxc               = local.ndfc_fabric_msite_ext_net.allow_nxc
  bgp_as                  = local.ndfc_fabric_msite_ext_net.bgp_as
  bootstrap_conf          = local.ndfc_fabric_msite_ext_net.bootstrap_conf
  bootstrap_conf_xe       = local.ndfc_fabric_msite_ext_net.bootstrap_conf_xe
  bootstrap_enable        = local.ndfc_fabric_msite_ext_net.bootstrap_enable
  bootstrap_multisubnet   = local.ndfc_fabric_msite_ext_net.bootstrap_multisubnet
  cdp_enable              = local.ndfc_fabric_msite_ext_net.cdp_enable
  dci_subnet_range        = local.ndfc_fabric_msite_ext_net.dci_subnet_range
  dci_subnet_target_mask  = local.ndfc_fabric_msite_ext_net.dci_subnet_target_mask
  deploy                  = local.ndfc_fabric_msite_ext_net.deploy
  deployment_freeze       = local.ndfc_fabric_msite_ext_net.deployment_freeze
  deployment_status       = local.ndfc_fabric_msite_ext_net.deployment_status
  dhcp_enable             = local.ndfc_fabric_msite_ext_net.dhcp_enable
  dhcp_end                = local.ndfc_fabric_msite_ext_net.dhcp_end
  dhcp_ipv6_enable        = local.ndfc_fabric_msite_ext_net.dhcp_ipv6_enable
  dhcp_start              = local.ndfc_fabric_msite_ext_net.dhcp_start
  domain_name             = local.ndfc_fabric_msite_ext_net.domain_name
  enable_aaa              = local.ndfc_fabric_msite_ext_net.enable_aaa
  enable_netflow          = local.ndfc_fabric_msite_ext_net.enable_netflow
  enable_nxapi            = local.ndfc_fabric_msite_ext_net.enable_nxapi
  enable_nxapi_http       = local.ndfc_fabric_msite_ext_net.enable_nxapi_http
  enable_real_time_backup = local.ndfc_fabric_msite_ext_net.enable_real_time_backup
  enable_rt_intf_stats    = local.ndfc_fabric_msite_ext_net.enable_rt_intf_stats
  enable_scheduled_backup = local.ndfc_fabric_msite_ext_net.enable_scheduled_backup
  ext_fabric_type         = local.ndfc_fabric_msite_ext_net.ext_fabric_type
  fabric_freeform         = local.ndfc_fabric_msite_ext_net.fabric_freeform
  fabric_name             = local.ndfc_fabric_msite_ext_net.fabric_name
  feature_ptp             = local.ndfc_fabric_msite_ext_net.feature_ptp
  ff                      = local.ndfc_fabric_msite_ext_net.ff
  inband_enable           = local.ndfc_fabric_msite_ext_net.inband_enable
  inband_mgmt             = local.ndfc_fabric_msite_ext_net.inband_mgmt
  intf_stat_load_interval = local.ndfc_fabric_msite_ext_net.intf_stat_load_interval
  is_read_only            = local.ndfc_fabric_msite_ext_net.is_read_only
  loopback0_ip_range      = local.ndfc_fabric_msite_ext_net.loopback0_ip_range
  mgmt_gw                 = local.ndfc_fabric_msite_ext_net.mgmt_gw
  mgmt_prefix             = local.ndfc_fabric_msite_ext_net.mgmt_prefix
  mgmt_v6prefix           = local.ndfc_fabric_msite_ext_net.mgmt_v6prefix
  mpls_handoff            = local.ndfc_fabric_msite_ext_net.mpls_handoff
  mpls_lb_id              = local.ndfc_fabric_msite_ext_net.mpls_lb_id
  mpls_loopback_ip_range  = local.ndfc_fabric_msite_ext_net.mpls_loopback_ip_range
  netflow_exporter_list   = local.ndfc_fabric_msite_ext_net.netflow_exporter_list
  netflow_monitor_list    = local.ndfc_fabric_msite_ext_net.netflow_monitor_list
  netflow_record_list     = local.ndfc_fabric_msite_ext_net.netflow_record_list
  netflow_sampler_list    = local.ndfc_fabric_msite_ext_net.netflow_sampler_list
  nxapi_http_port         = local.ndfc_fabric_msite_ext_net.nxapi_http_port
  nxapi_https_port        = local.ndfc_fabric_msite_ext_net.nxapi_https_port
  nxc_dest_vrf            = local.ndfc_fabric_msite_ext_net.nxc_dest_vrf
  nxc_proxy_port          = local.ndfc_fabric_msite_ext_net.nxc_proxy_port
  nxc_proxy_server        = local.ndfc_fabric_msite_ext_net.nxc_proxy_server
  nxc_src_intf            = local.ndfc_fabric_msite_ext_net.nxc_src_intf
  overwrite_global_nxc    = local.ndfc_fabric_msite_ext_net.overwrite_global_nxc
  pm_enable               = local.ndfc_fabric_msite_ext_net.pm_enable
  pnp_enable              = local.ndfc_fabric_msite_ext_net.pnp_enable
  power_redundancy_mode   = local.ndfc_fabric_msite_ext_net.power_redundancy_mode
  ptp_domain_id           = local.ndfc_fabric_msite_ext_net.ptp_domain_id
  ptp_lb_id               = local.ndfc_fabric_msite_ext_net.ptp_lb_id
  scheduled_time          = local.ndfc_fabric_msite_ext_net.scheduled_time
  snmp_server_host_trap   = local.ndfc_fabric_msite_ext_net.snmp_server_host_trap
  subinterface_range      = local.ndfc_fabric_msite_ext_net.subinterface_range
}
