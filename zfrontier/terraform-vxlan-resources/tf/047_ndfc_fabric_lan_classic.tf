# 047 ndfc_fabric_lan_classic — 8. Other
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/fabric_lan_classic
# Reads ../models/ndfc_fabric_lan_classic.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_fabric_lan_classic = yamldecode(file("${path.module}/../models/ndfc_fabric_lan_classic.yml"))["ndfc_fabric_lan_classic"]
}

resource "ndfc_fabric_lan_classic" "this" {
  aaa_remote_ip_enabled   = local.ndfc_fabric_lan_classic.aaa_remote_ip_enabled
  aaa_server_conf         = local.ndfc_fabric_lan_classic.aaa_server_conf
  allow_nxc               = local.ndfc_fabric_lan_classic.allow_nxc
  bootstrap_conf          = local.ndfc_fabric_lan_classic.bootstrap_conf
  bootstrap_enable        = local.ndfc_fabric_lan_classic.bootstrap_enable
  bootstrap_multisubnet   = local.ndfc_fabric_lan_classic.bootstrap_multisubnet
  cdp_enable              = local.ndfc_fabric_lan_classic.cdp_enable
  dci_subnet_range        = local.ndfc_fabric_lan_classic.dci_subnet_range
  dci_subnet_target_mask  = local.ndfc_fabric_lan_classic.dci_subnet_target_mask
  deploy                  = local.ndfc_fabric_lan_classic.deploy
  deployment_freeze       = local.ndfc_fabric_lan_classic.deployment_freeze
  dhcp_enable             = local.ndfc_fabric_lan_classic.dhcp_enable
  dhcp_end                = local.ndfc_fabric_lan_classic.dhcp_end
  dhcp_ipv6_enable        = local.ndfc_fabric_lan_classic.dhcp_ipv6_enable
  dhcp_start              = local.ndfc_fabric_lan_classic.dhcp_start
  enable_aaa              = local.ndfc_fabric_lan_classic.enable_aaa
  enable_netflow          = local.ndfc_fabric_lan_classic.enable_netflow
  enable_nxapi            = local.ndfc_fabric_lan_classic.enable_nxapi
  enable_nxapi_http       = local.ndfc_fabric_lan_classic.enable_nxapi_http
  enable_real_time_backup = local.ndfc_fabric_lan_classic.enable_real_time_backup
  enable_rt_intf_stats    = local.ndfc_fabric_lan_classic.enable_rt_intf_stats
  enable_scheduled_backup = local.ndfc_fabric_lan_classic.enable_scheduled_backup
  ext_fabric_type         = local.ndfc_fabric_lan_classic.ext_fabric_type
  fabric_freeform         = local.ndfc_fabric_lan_classic.fabric_freeform
  fabric_name             = local.ndfc_fabric_lan_classic.fabric_name
  feature_ptp             = local.ndfc_fabric_lan_classic.feature_ptp
  ff                      = local.ndfc_fabric_lan_classic.ff
  inband_enable           = local.ndfc_fabric_lan_classic.inband_enable
  inband_mgmt             = local.ndfc_fabric_lan_classic.inband_mgmt
  intf_stat_load_interval = local.ndfc_fabric_lan_classic.intf_stat_load_interval
  is_read_only            = local.ndfc_fabric_lan_classic.is_read_only
  loopback0_ip_range      = local.ndfc_fabric_lan_classic.loopback0_ip_range
  mgmt_gw                 = local.ndfc_fabric_lan_classic.mgmt_gw
  mgmt_prefix             = local.ndfc_fabric_lan_classic.mgmt_prefix
  mpls_handoff            = local.ndfc_fabric_lan_classic.mpls_handoff
  mpls_lb_id              = local.ndfc_fabric_lan_classic.mpls_lb_id
  mpls_loopback_ip_range  = local.ndfc_fabric_lan_classic.mpls_loopback_ip_range
  netflow_exporter_list   = local.ndfc_fabric_lan_classic.netflow_exporter_list
  netflow_monitor_list    = local.ndfc_fabric_lan_classic.netflow_monitor_list
  netflow_record_list     = local.ndfc_fabric_lan_classic.netflow_record_list
  netflow_sampler_list    = local.ndfc_fabric_lan_classic.netflow_sampler_list
  nxapi_http_port         = local.ndfc_fabric_lan_classic.nxapi_http_port
  nxapi_https_port        = local.ndfc_fabric_lan_classic.nxapi_https_port
  nxc_dest_vrf            = local.ndfc_fabric_lan_classic.nxc_dest_vrf
  nxc_proxy_port          = local.ndfc_fabric_lan_classic.nxc_proxy_port
  nxc_proxy_server        = local.ndfc_fabric_lan_classic.nxc_proxy_server
  nxc_src_intf            = local.ndfc_fabric_lan_classic.nxc_src_intf
  overwrite_global_nxc    = local.ndfc_fabric_lan_classic.overwrite_global_nxc
  pm_enable               = local.ndfc_fabric_lan_classic.pm_enable
  power_redundancy_mode   = local.ndfc_fabric_lan_classic.power_redundancy_mode
  ptp_domain_id           = local.ndfc_fabric_lan_classic.ptp_domain_id
  ptp_lb_id               = local.ndfc_fabric_lan_classic.ptp_lb_id
  scheduled_time          = local.ndfc_fabric_lan_classic.scheduled_time
  snmp_server_host_trap   = local.ndfc_fabric_lan_classic.snmp_server_host_trap
  subinterface_range      = local.ndfc_fabric_lan_classic.subinterface_range
}
