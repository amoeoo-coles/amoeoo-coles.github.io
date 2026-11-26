# Combined VXLAN EVPN build in chronological order.
# Reads sample/vxlan-model.yml. Each resource waits for the previous one of the same provider.

locals {
  vxlan = yamldecode(file("${path.module}/sample/vxlan-model.yml"))["resources"]
}

# 001 1. Global, fabric and features
resource "nxos_feature" "this" {
  analytics                                = local.vxlan.nxos_feature.analytics
  bash_shell                               = local.vxlan.nxos_feature.bash_shell
  bfd                                      = local.vxlan.nxos_feature.bfd
  bgp                                      = local.vxlan.nxos_feature.bgp
  deletion_policy                          = local.vxlan.nxos_feature.deletion_policy
  device                                   = local.vxlan.nxos_feature.device
  dhcp                                     = local.vxlan.nxos_feature.dhcp
  dot1x                                    = local.vxlan.nxos_feature.dot1x
  eigrp                                    = local.vxlan.nxos_feature.eigrp
  epbr                                     = local.vxlan.nxos_feature.epbr
  evpn                                     = local.vxlan.nxos_feature.evpn
  feature_sets                             = local.vxlan.nxos_feature.feature_sets
  grpc                                     = local.vxlan.nxos_feature.grpc
  hmm                                      = local.vxlan.nxos_feature.hmm
  hsrp                                     = local.vxlan.nxos_feature.hsrp
  interface_vlan                           = local.vxlan.nxos_feature.interface_vlan
  isis                                     = local.vxlan.nxos_feature.isis
  lacp                                     = local.vxlan.nxos_feature.lacp
  lldp                                     = local.vxlan.nxos_feature.lldp
  macsec                                   = local.vxlan.nxos_feature.macsec
  mpls_l3vpn                               = local.vxlan.nxos_feature.mpls_l3vpn
  mpls_segment_routing                     = local.vxlan.nxos_feature.mpls_segment_routing
  mpls_segment_routing_traffic_engineering = local.vxlan.nxos_feature.mpls_segment_routing_traffic_engineering
  msdp                                     = local.vxlan.nxos_feature.msdp
  nat                                      = local.vxlan.nxos_feature.nat
  netconf                                  = local.vxlan.nxos_feature.netconf
  netflow                                  = local.vxlan.nxos_feature.netflow
  ngmvpn                                   = local.vxlan.nxos_feature.ngmvpn
  ngoam                                    = local.vxlan.nxos_feature.ngoam
  nv_overlay                               = local.vxlan.nxos_feature.nv_overlay
  nxapi                                    = local.vxlan.nxos_feature.nxapi
  openconfig                               = local.vxlan.nxos_feature.openconfig
  ospf                                     = local.vxlan.nxos_feature.ospf
  ospfv3                                   = local.vxlan.nxos_feature.ospfv3
  pbr                                      = local.vxlan.nxos_feature.pbr
  pim                                      = local.vxlan.nxos_feature.pim
  poe                                      = local.vxlan.nxos_feature.poe
  port_security                            = local.vxlan.nxos_feature.port_security
  ptp                                      = local.vxlan.nxos_feature.ptp
  pvlan                                    = local.vxlan.nxos_feature.pvlan
  restconf                                 = local.vxlan.nxos_feature.restconf
  scheduler                                = local.vxlan.nxos_feature.scheduler
  scp_server                               = local.vxlan.nxos_feature.scp_server
  security_group                           = local.vxlan.nxos_feature.security_group
  service_acceleration                     = local.vxlan.nxos_feature.service_acceleration
  sflow                                    = local.vxlan.nxos_feature.sflow
  sftp_server                              = local.vxlan.nxos_feature.sftp_server
  sla_responder                            = local.vxlan.nxos_feature.sla_responder
  sla_sender                               = local.vxlan.nxos_feature.sla_sender
  sla_twamp_server                         = local.vxlan.nxos_feature.sla_twamp_server
  srv6                                     = local.vxlan.nxos_feature.srv6
  ssh                                      = local.vxlan.nxos_feature.ssh
  tacacs                                   = local.vxlan.nxos_feature.tacacs
  telemetry                                = local.vxlan.nxos_feature.telemetry
  telnet                                   = local.vxlan.nxos_feature.telnet
  tunnel                                   = local.vxlan.nxos_feature.tunnel
  udld                                     = local.vxlan.nxos_feature.udld
  vn_segment                               = local.vxlan.nxos_feature.vn_segment
  vpc                                      = local.vxlan.nxos_feature.vpc
  vrrp                                     = local.vxlan.nxos_feature.vrrp
  vrrpv3                                   = local.vxlan.nxos_feature.vrrpv3
  vtp                                      = local.vxlan.nxos_feature.vtp
}

# 002 1. Global, fabric and features
resource "nxos_system" "this" {
  acl_log_detailed                                   = local.vxlan.nxos_system.acl_log_detailed
  acl_log_entries                                    = local.vxlan.nxos_system.acl_log_entries
  acl_log_include_mac                                = local.vxlan.nxos_system.acl_log_include_mac
  acl_log_include_sgt                                = local.vxlan.nxos_system.acl_log_include_sgt
  acl_log_interval                                   = local.vxlan.nxos_system.acl_log_interval
  acl_log_match_log_level                            = local.vxlan.nxos_system.acl_log_match_log_level
  acl_log_threshold                                  = local.vxlan.nxos_system.acl_log_threshold
  arp_admin_state                                    = local.vxlan.nxos_system.arp_admin_state
  arp_allow_static_arp_outside_subnet                = local.vxlan.nxos_system.arp_allow_static_arp_outside_subnet
  arp_cache_limit                                    = local.vxlan.nxos_system.arp_cache_limit
  arp_cache_syslog_rate                              = local.vxlan.nxos_system.arp_cache_syslog_rate
  arp_control                                        = local.vxlan.nxos_system.arp_control
  arp_evpn_timeout                                   = local.vxlan.nxos_system.arp_evpn_timeout
  arp_instance_admin_state                           = local.vxlan.nxos_system.arp_instance_admin_state
  arp_interface_cache_limit                          = local.vxlan.nxos_system.arp_interface_cache_limit
  arp_ip_adjacency_route_distance                    = local.vxlan.nxos_system.arp_ip_adjacency_route_distance
  arp_ip_arp_cos                                     = local.vxlan.nxos_system.arp_ip_arp_cos
  arp_off_list_timeout                               = local.vxlan.nxos_system.arp_off_list_timeout
  arp_rarp_fabric_forwarding                         = local.vxlan.nxos_system.arp_rarp_fabric_forwarding
  arp_rarp_fabric_forwarding_rate                    = local.vxlan.nxos_system.arp_rarp_fabric_forwarding_rate
  arp_resolve_outside_subnet                         = local.vxlan.nxos_system.arp_resolve_outside_subnet
  arp_suppression_timeout                            = local.vxlan.nxos_system.arp_suppression_timeout
  arp_timeout                                        = local.vxlan.nxos_system.arp_timeout
  arp_unnumbered_svi_software_replication            = local.vxlan.nxos_system.arp_unnumbered_svi_software_replication
  arp_vpc_domains                                    = local.vxlan.nxos_system.arp_vpc_domains
  boot_aci                                           = local.vxlan.nxos_system.boot_aci
  boot_auto_copy                                     = local.vxlan.nxos_system.boot_auto_copy
  boot_dhcp                                          = local.vxlan.nxos_system.boot_dhcp
  boot_exclude_configuration                         = local.vxlan.nxos_system.boot_exclude_configuration
  boot_fex                                           = local.vxlan.nxos_system.boot_fex
  boot_image_supervisor_1                            = local.vxlan.nxos_system.boot_image_supervisor_1
  boot_image_supervisor_2                            = local.vxlan.nxos_system.boot_image_supervisor_2
  boot_image_verification                            = local.vxlan.nxos_system.boot_image_verification
  boot_mode                                          = local.vxlan.nxos_system.boot_mode
  boot_order                                         = local.vxlan.nxos_system.boot_order
  boot_poap                                          = local.vxlan.nxos_system.boot_poap
  breakout_modules                                   = local.vxlan.nxos_system.breakout_modules
  cdp_admin_state                                    = local.vxlan.nxos_system.cdp_admin_state
  cdp_device_id_type                                 = local.vxlan.nxos_system.cdp_device_id_type
  cdp_hold_interval                                  = local.vxlan.nxos_system.cdp_hold_interval
  cdp_interfaces                                     = local.vxlan.nxos_system.cdp_interfaces
  cdp_pnp_startup_vlan                               = local.vxlan.nxos_system.cdp_pnp_startup_vlan
  cdp_transmit_frequency                             = local.vxlan.nxos_system.cdp_transmit_frequency
  cdp_version                                        = local.vxlan.nxos_system.cdp_version
  cfs_admin_state                                    = local.vxlan.nxos_system.cfs_admin_state
  cfs_distribute                                     = local.vxlan.nxos_system.cfs_distribute
  cfs_ethernet_distribution                          = local.vxlan.nxos_system.cfs_ethernet_distribution
  cfs_ipv4_distribution                              = local.vxlan.nxos_system.cfs_ipv4_distribution
  cfs_ipv4_multicast_address                         = local.vxlan.nxos_system.cfs_ipv4_multicast_address
  cfs_ipv6_distribution                              = local.vxlan.nxos_system.cfs_ipv6_distribution
  cfs_ipv6_multicast_address                         = local.vxlan.nxos_system.cfs_ipv6_multicast_address
  cli_aliases                                        = local.vxlan.nxos_system.cli_aliases
  clock_admin_state                                  = local.vxlan.nxos_system.clock_admin_state
  clock_authentication_state                         = local.vxlan.nxos_system.clock_authentication_state
  clock_format                                       = local.vxlan.nxos_system.clock_format
  clock_format_debug                                 = local.vxlan.nxos_system.clock_format_debug
  clock_format_syslog                                = local.vxlan.nxos_system.clock_format_syslog
  clock_protocol                                     = local.vxlan.nxos_system.clock_protocol
  clock_summer_time_end_day                          = local.vxlan.nxos_system.clock_summer_time_end_day
  clock_summer_time_end_month                        = local.vxlan.nxos_system.clock_summer_time_end_month
  clock_summer_time_end_time                         = local.vxlan.nxos_system.clock_summer_time_end_time
  clock_summer_time_end_week                         = local.vxlan.nxos_system.clock_summer_time_end_week
  clock_summer_time_name                             = local.vxlan.nxos_system.clock_summer_time_name
  clock_summer_time_offset_minutes                   = local.vxlan.nxos_system.clock_summer_time_offset_minutes
  clock_summer_time_start_day                        = local.vxlan.nxos_system.clock_summer_time_start_day
  clock_summer_time_start_month                      = local.vxlan.nxos_system.clock_summer_time_start_month
  clock_summer_time_start_time                       = local.vxlan.nxos_system.clock_summer_time_start_time
  clock_summer_time_start_week                       = local.vxlan.nxos_system.clock_summer_time_start_week
  clock_timezone_hours                               = local.vxlan.nxos_system.clock_timezone_hours
  clock_timezone_minutes                             = local.vxlan.nxos_system.clock_timezone_minutes
  clock_timezone_name                                = local.vxlan.nxos_system.clock_timezone_name
  console_exec_timeout                               = local.vxlan.nxos_system.console_exec_timeout
  copp_admin_state                                   = local.vxlan.nxos_system.copp_admin_state
  copp_class_maps                                    = local.vxlan.nxos_system.copp_class_maps
  copp_policy_maps                                   = local.vxlan.nxos_system.copp_policy_maps
  copp_profile_type                                  = local.vxlan.nxos_system.copp_profile_type
  copp_rate_limiter                                  = local.vxlan.nxos_system.copp_rate_limiter
  copp_service_policies                              = local.vxlan.nxos_system.copp_service_policies
  deletion_policy                                    = local.vxlan.nxos_system.deletion_policy
  device                                             = local.vxlan.nxos_system.device
  dns_admin_state                                    = local.vxlan.nxos_system.dns_admin_state
  dns_profiles                                       = local.vxlan.nxos_system.dns_profiles
  errdisable_events                                  = local.vxlan.nxos_system.errdisable_events
  errdisable_recovery_admin_state                    = local.vxlan.nxos_system.errdisable_recovery_admin_state
  errdisable_recovery_control                        = local.vxlan.nxos_system.errdisable_recovery_control
  errdisable_recovery_interval                       = local.vxlan.nxos_system.errdisable_recovery_interval
  erspan_origin_ip_address                           = local.vxlan.nxos_system.erspan_origin_ip_address
  erspan_origin_ip_is_global                         = local.vxlan.nxos_system.erspan_origin_ip_is_global
  erspan_origin_ip_is_global_ipv6                    = local.vxlan.nxos_system.erspan_origin_ip_is_global_ipv6
  erspan_origin_ipv6_address                         = local.vxlan.nxos_system.erspan_origin_ipv6_address
  ethernet_admin_link_down_syslog_level              = local.vxlan.nxos_system.ethernet_admin_link_down_syslog_level
  ethernet_admin_link_up_syslog_level                = local.vxlan.nxos_system.ethernet_admin_link_up_syslog_level
  ethernet_admin_state                               = local.vxlan.nxos_system.ethernet_admin_state
  ethernet_allow_unsupported_sfp                     = local.vxlan.nxos_system.ethernet_allow_unsupported_sfp
  ethernet_chassis_infrastructure_adaptor_vlan       = local.vxlan.nxos_system.ethernet_chassis_infrastructure_adaptor_vlan
  ethernet_chassis_infrastructure_epds_port_number   = local.vxlan.nxos_system.ethernet_chassis_infrastructure_epds_port_number
  ethernet_chassis_infrastructure_ipv6_address       = local.vxlan.nxos_system.ethernet_chassis_infrastructure_ipv6_address
  ethernet_chassis_infrastructure_vlan               = local.vxlan.nxos_system.ethernet_chassis_infrastructure_vlan
  ethernet_chassis_management_instance               = local.vxlan.nxos_system.ethernet_chassis_management_instance
  ethernet_chassis_management_instance_fabric_number = local.vxlan.nxos_system.ethernet_chassis_management_instance_fabric_number
  ethernet_control                                   = local.vxlan.nxos_system.ethernet_control
  ethernet_default_admin_state                       = local.vxlan.nxos_system.ethernet_default_admin_state
  ethernet_default_layer                             = local.vxlan.nxos_system.ethernet_default_layer
  ethernet_interface_syslog_info                     = local.vxlan.nxos_system.ethernet_interface_syslog_info
  ethernet_log_event                                 = local.vxlan.nxos_system.ethernet_log_event
  ethernet_mtu                                       = local.vxlan.nxos_system.ethernet_mtu
  ethernet_system_interface_admin_state              = local.vxlan.nxos_system.ethernet_system_interface_admin_state
  ethernet_system_link_failure_laser_on              = local.vxlan.nxos_system.ethernet_system_link_failure_laser_on
  ethernet_system_storm_control_multi_threshold      = local.vxlan.nxos_system.ethernet_system_storm_control_multi_threshold
  ethernet_vlan_tag_native                           = local.vxlan.nxos_system.ethernet_vlan_tag_native
  ftp_source_interfaces                              = local.vxlan.nxos_system.ftp_source_interfaces
  grpc_certificate                                   = local.vxlan.nxos_system.grpc_certificate
  grpc_client_root_certificate                       = local.vxlan.nxos_system.grpc_client_root_certificate
  grpc_gnmi_filter_file                              = local.vxlan.nxos_system.grpc_gnmi_filter_file
  grpc_gnmi_filter_md5_hash                          = local.vxlan.nxos_system.grpc_gnmi_filter_md5_hash
  grpc_gnmi_keepalive_timeout                        = local.vxlan.nxos_system.grpc_gnmi_keepalive_timeout
  grpc_gnmi_max_concurrent_calls                     = local.vxlan.nxos_system.grpc_gnmi_max_concurrent_calls
  grpc_gnmi_merge_subscriptions                      = local.vxlan.nxos_system.grpc_gnmi_merge_subscriptions
  grpc_gnmi_min_sample_interval                      = local.vxlan.nxos_system.grpc_gnmi_min_sample_interval
  grpc_gnmi_subscription_query_condition             = local.vxlan.nxos_system.grpc_gnmi_subscription_query_condition
  grpc_port                                          = local.vxlan.nxos_system.grpc_port
  grpc_vrf                                           = local.vxlan.nxos_system.grpc_vrf
  icam_monitor_interval                              = local.vxlan.nxos_system.icam_monitor_interval
  icam_number_of_intervals                           = local.vxlan.nxos_system.icam_number_of_intervals
  icam_scale_configuration                           = local.vxlan.nxos_system.icam_scale_configuration
  icam_scale_critical_threshold                      = local.vxlan.nxos_system.icam_scale_critical_threshold
  icam_scale_info_threshold                          = local.vxlan.nxos_system.icam_scale_info_threshold
  icam_scale_warning_threshold                       = local.vxlan.nxos_system.icam_scale_warning_threshold
  l2rib_duplicate_mac_detection_duration             = local.vxlan.nxos_system.l2rib_duplicate_mac_detection_duration
  l2rib_duplicate_mac_detection_moves                = local.vxlan.nxos_system.l2rib_duplicate_mac_detection_moves
  l2rib_duplicate_mac_recovery_retry_count           = local.vxlan.nxos_system.l2rib_duplicate_mac_recovery_retry_count
  l2rib_duplicate_mac_recovery_timeout               = local.vxlan.nxos_system.l2rib_duplicate_mac_recovery_timeout
  lacp_control                                       = local.vxlan.nxos_system.lacp_control
  lacp_front_panel_port_numbering                    = local.vxlan.nxos_system.lacp_front_panel_port_numbering
  lacp_interfaces                                    = local.vxlan.nxos_system.lacp_interfaces
  lacp_system_mac                                    = local.vxlan.nxos_system.lacp_system_mac
  lacp_system_priority                               = local.vxlan.nxos_system.lacp_system_priority
  lacp_system_role                                   = local.vxlan.nxos_system.lacp_system_role
  lldp_admin_state                                   = local.vxlan.nxos_system.lldp_admin_state
  lldp_advertise_system_chassis_id                   = local.vxlan.nxos_system.lldp_advertise_system_chassis_id
  lldp_control                                       = local.vxlan.nxos_system.lldp_control
  lldp_hold_time                                     = local.vxlan.nxos_system.lldp_hold_time
  lldp_infra_vlan                                    = local.vxlan.nxos_system.lldp_infra_vlan
  lldp_init_delay_time                               = local.vxlan.nxos_system.lldp_init_delay_time
  lldp_instance_admin_state                          = local.vxlan.nxos_system.lldp_instance_admin_state
  lldp_interfaces                                    = local.vxlan.nxos_system.lldp_interfaces
  lldp_multi_peer                                    = local.vxlan.nxos_system.lldp_multi_peer
  lldp_optional_tlv_select                           = local.vxlan.nxos_system.lldp_optional_tlv_select
  lldp_optional_tlv_select_hidden                    = local.vxlan.nxos_system.lldp_optional_tlv_select_hidden
  lldp_port_channel                                  = local.vxlan.nxos_system.lldp_port_channel
  lldp_port_id_sub_type                              = local.vxlan.nxos_system.lldp_port_id_sub_type
  lldp_system_description                            = local.vxlan.nxos_system.lldp_system_description
  lldp_transmit_frequency                            = local.vxlan.nxos_system.lldp_transmit_frequency
  mac_address_table_aging_time                       = local.vxlan.nxos_system.mac_address_table_aging_time
  mac_address_table_notification_mac_move            = local.vxlan.nxos_system.mac_address_table_notification_mac_move
  mac_address_table_static_clear                     = local.vxlan.nxos_system.mac_address_table_static_clear
  mac_address_table_static_entries                   = local.vxlan.nxos_system.mac_address_table_static_entries
  mac_address_table_system_limit                     = local.vxlan.nxos_system.mac_address_table_system_limit
  mac_address_table_threshold_interval               = local.vxlan.nxos_system.mac_address_table_threshold_interval
  mac_address_table_threshold_limit                  = local.vxlan.nxos_system.mac_address_table_threshold_limit
  mac_address_table_user_defined_limit               = local.vxlan.nxos_system.mac_address_table_user_defined_limit
  mpls_admin_state                                   = local.vxlan.nxos_system.mpls_admin_state
  mpls_interfaces                                    = local.vxlan.nxos_system.mpls_interfaces
  name                                               = local.vxlan.nxos_system.name
  nd_accept_solicit_neighbor_entry                   = local.vxlan.nxos_system.nd_accept_solicit_neighbor_entry
  nd_admin_state                                     = local.vxlan.nxos_system.nd_admin_state
  nd_aging_interval                                  = local.vxlan.nxos_system.nd_aging_interval
  nd_cache_limit                                     = local.vxlan.nxos_system.nd_cache_limit
  nd_cache_syslog_rate                               = local.vxlan.nxos_system.nd_cache_syslog_rate
  nd_control                                         = local.vxlan.nxos_system.nd_control
  nd_instance_admin_state                            = local.vxlan.nxos_system.nd_instance_admin_state
  nd_ipv6_adjacency_route_distance                   = local.vxlan.nxos_system.nd_ipv6_adjacency_route_distance
  nd_off_list_timeout                                = local.vxlan.nxos_system.nd_off_list_timeout
  nd_probe_interval_for_solicit_neighbor             = local.vxlan.nxos_system.nd_probe_interval_for_solicit_neighbor
  nd_solicit_neighbor_advertisement                  = local.vxlan.nxos_system.nd_solicit_neighbor_advertisement
  nd_vpc_domains                                     = local.vxlan.nxos_system.nd_vpc_domains
  nd_vrfs                                            = local.vxlan.nxos_system.nd_vrfs
  ngmvpn_admin_state                                 = local.vxlan.nxos_system.ngmvpn_admin_state
  ngmvpn_control                                     = local.vxlan.nxos_system.ngmvpn_control
  ngmvpn_instance_admin_state                        = local.vxlan.nxos_system.ngmvpn_instance_admin_state
  ngmvpn_overlay_distributed_dr                      = local.vxlan.nxos_system.ngmvpn_overlay_distributed_dr
  ngmvpn_overlay_spt_only                            = local.vxlan.nxos_system.ngmvpn_overlay_spt_only
  ngmvpn_vrfs                                        = local.vxlan.nxos_system.ngmvpn_vrfs
  ngoam_install_acl                                  = local.vxlan.nxos_system.ngoam_install_acl
  ngoam_loop_detection                               = local.vxlan.nxos_system.ngoam_loop_detection
  ngoam_loop_detection_periodic_probe_interval       = local.vxlan.nxos_system.ngoam_loop_detection_periodic_probe_interval
  ngoam_loop_detection_port_recovery_interval        = local.vxlan.nxos_system.ngoam_loop_detection_port_recovery_interval
  nxapi_certificate_enable                           = local.vxlan.nxos_system.nxapi_certificate_enable
  nxapi_certificate_file                             = local.vxlan.nxos_system.nxapi_certificate_file
  nxapi_client_certificate_authentication            = local.vxlan.nxos_system.nxapi_client_certificate_authentication
  nxapi_encrypted_key_passphrase                     = local.vxlan.nxos_system.nxapi_encrypted_key_passphrase
  nxapi_encrypted_key_passphrase_wo_version          = local.vxlan.nxos_system.nxapi_encrypted_key_passphrase_wo_version
  nxapi_http_port                                    = local.vxlan.nxos_system.nxapi_http_port
  nxapi_https_port                                   = local.vxlan.nxos_system.nxapi_https_port
  nxapi_idle_timeout                                 = local.vxlan.nxos_system.nxapi_idle_timeout
  nxapi_key_file                                     = local.vxlan.nxos_system.nxapi_key_file
  nxapi_ssl_ciphers_weak                             = local.vxlan.nxos_system.nxapi_ssl_ciphers_weak
  nxapi_ssl_protocols                                = local.vxlan.nxos_system.nxapi_ssl_protocols
  nxapi_sudi                                         = local.vxlan.nxos_system.nxapi_sudi
  nxapi_trustpoint                                   = local.vxlan.nxos_system.nxapi_trustpoint
  nxapi_vrf                                          = local.vxlan.nxos_system.nxapi_vrf
  password_encryption_admin_state                    = local.vxlan.nxos_system.password_encryption_admin_state
  password_encryption_use_tam                        = local.vxlan.nxos_system.password_encryption_use_tam
  pvlan_fex_trunk                                    = local.vxlan.nxos_system.pvlan_fex_trunk
  pvlan_interfaces                                   = local.vxlan.nxos_system.pvlan_interfaces
  pvlan_svis                                         = local.vxlan.nxos_system.pvlan_svis
  pvlans                                             = local.vxlan.nxos_system.pvlans
  qos_dynamic_buffer_sharing                         = local.vxlan.nxos_system.qos_dynamic_buffer_sharing
  qos_mode                                           = local.vxlan.nxos_system.qos_mode
  qos_policies_statistics                            = local.vxlan.nxos_system.qos_policies_statistics
  qos_reset_dei                                      = local.vxlan.nxos_system.qos_reset_dei
  qos_statistics                                     = local.vxlan.nxos_system.qos_statistics
  service_instances                                  = local.vxlan.nxos_system.service_instances
  smart_licensing_transport_cslu_url                 = local.vxlan.nxos_system.smart_licensing_transport_cslu_url
  smart_licensing_transport_mode                     = local.vxlan.nxos_system.smart_licensing_transport_mode
  ssh_admin_state                                    = local.vxlan.nxos_system.ssh_admin_state
  ssh_ciphers                                        = local.vxlan.nxos_system.ssh_ciphers
  ssh_description                                    = local.vxlan.nxos_system.ssh_description
  ssh_enable_weak_ciphers                            = local.vxlan.nxos_system.ssh_enable_weak_ciphers
  ssh_key_exchange_algorithms                        = local.vxlan.nxos_system.ssh_key_exchange_algorithms
  ssh_key_types                                      = local.vxlan.nxos_system.ssh_key_types
  ssh_keys                                           = local.vxlan.nxos_system.ssh_keys
  ssh_login_attempts                                 = local.vxlan.nxos_system.ssh_login_attempts
  ssh_login_grace_time                               = local.vxlan.nxos_system.ssh_login_grace_time
  ssh_message_authentication_codes                   = local.vxlan.nxos_system.ssh_message_authentication_codes
  ssh_port                                           = local.vxlan.nxos_system.ssh_port
  ssh_source_interfaces                              = local.vxlan.nxos_system.ssh_source_interfaces
  ttag_interfaces                                    = local.vxlan.nxos_system.ttag_interfaces
  ttag_marker_interval                               = local.vxlan.nxos_system.ttag_marker_interval
  udld_admin_state                                   = local.vxlan.nxos_system.udld_admin_state
  udld_aggressive                                    = local.vxlan.nxos_system.udld_aggressive
  udld_interfaces                                    = local.vxlan.nxos_system.udld_interfaces
  udld_message_interval                              = local.vxlan.nxos_system.udld_message_interval
  vdcs                                               = local.vxlan.nxos_system.vdcs
  vty_exec_timeout                                   = local.vxlan.nxos_system.vty_exec_timeout
  vty_session_limit                                  = local.vxlan.nxos_system.vty_session_limit
  depends_on                                         = [nxos_feature.this]
}

# 003 1. Global, fabric and features
resource "nxos_platform" "this" {
  access_list_match_inner_header                               = local.vxlan.nxos_platform.access_list_match_inner_header
  acl_tap_aggregation                                          = local.vxlan.nxos_platform.acl_tap_aggregation
  deletion_policy                                              = local.vxlan.nxos_platform.deletion_policy
  description                                                  = local.vxlan.nxos_platform.description
  device                                                       = local.vxlan.nxos_platform.device
  disable_parse_error                                          = local.vxlan.nxos_platform.disable_parse_error
  dlb_allow_all_interfaces                                     = local.vxlan.nxos_platform.dlb_allow_all_interfaces
  dlb_decay_factor                                             = local.vxlan.nxos_platform.dlb_decay_factor
  dlb_description                                              = local.vxlan.nxos_platform.dlb_description
  dlb_dre_threshold_level_1                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_1
  dlb_dre_threshold_level_2                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_2
  dlb_dre_threshold_level_3                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_3
  dlb_dre_threshold_level_4                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_4
  dlb_dre_threshold_level_5                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_5
  dlb_dre_threshold_level_6                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_6
  dlb_dre_threshold_level_7                                    = local.vxlan.nxos_platform.dlb_dre_threshold_level_7
  dlb_enabled                                                  = local.vxlan.nxos_platform.dlb_enabled
  dlb_flowlet_aging                                            = local.vxlan.nxos_platform.dlb_flowlet_aging
  dlb_interfaces                                               = local.vxlan.nxos_platform.dlb_interfaces
  dlb_load_awareness                                           = local.vxlan.nxos_platform.dlb_load_awareness
  dlb_mac_address                                              = local.vxlan.nxos_platform.dlb_mac_address
  dlb_mode                                                     = local.vxlan.nxos_platform.dlb_mode
  dlb_sampling_interval                                        = local.vxlan.nxos_platform.dlb_sampling_interval
  dlb_static_pinning                                           = local.vxlan.nxos_platform.dlb_static_pinning
  dlb_static_pinnings                                          = local.vxlan.nxos_platform.dlb_static_pinnings
  dot1q_tunnel_transit_range                                   = local.vxlan.nxos_platform.dot1q_tunnel_transit_range
  extended_acl_disable_redirect_share                          = local.vxlan.nxos_platform.extended_acl_disable_redirect_share
  extended_atomic_update                                       = local.vxlan.nxos_platform.extended_atomic_update
  extended_atomic_update_strict                                = local.vxlan.nxos_platform.extended_atomic_update_strict
  extended_counter_manager_bfd_scale                           = local.vxlan.nxos_platform.extended_counter_manager_bfd_scale
  extended_counter_manager_ecn_scale                           = local.vxlan.nxos_platform.extended_counter_manager_ecn_scale
  extended_counter_manager_egress_acl_scale                    = local.vxlan.nxos_platform.extended_counter_manager_egress_acl_scale
  extended_counter_manager_feature_bfd                         = local.vxlan.nxos_platform.extended_counter_manager_feature_bfd
  extended_counter_manager_feature_ecn                         = local.vxlan.nxos_platform.extended_counter_manager_feature_ecn
  extended_counter_manager_feature_egress_acl                  = local.vxlan.nxos_platform.extended_counter_manager_feature_egress_acl
  extended_counter_manager_feature_ingress_acl                 = local.vxlan.nxos_platform.extended_counter_manager_feature_ingress_acl
  extended_counter_manager_feature_l2vni                       = local.vxlan.nxos_platform.extended_counter_manager_feature_l2vni
  extended_counter_manager_feature_l3vni                       = local.vxlan.nxos_platform.extended_counter_manager_feature_l3vni
  extended_counter_manager_feature_si                          = local.vxlan.nxos_platform.extended_counter_manager_feature_si
  extended_counter_manager_feature_svi                         = local.vxlan.nxos_platform.extended_counter_manager_feature_svi
  extended_counter_manager_feature_tunnel                      = local.vxlan.nxos_platform.extended_counter_manager_feature_tunnel
  extended_counter_manager_feature_vlan                        = local.vxlan.nxos_platform.extended_counter_manager_feature_vlan
  extended_counter_manager_feature_voq                         = local.vxlan.nxos_platform.extended_counter_manager_feature_voq
  extended_counter_manager_ingress_acl_scale                   = local.vxlan.nxos_platform.extended_counter_manager_ingress_acl_scale
  extended_counter_manager_l2vni_scale                         = local.vxlan.nxos_platform.extended_counter_manager_l2vni_scale
  extended_counter_manager_l3vni_scale                         = local.vxlan.nxos_platform.extended_counter_manager_l3vni_scale
  extended_counter_manager_si_scale                            = local.vxlan.nxos_platform.extended_counter_manager_si_scale
  extended_counter_manager_svi_scale                           = local.vxlan.nxos_platform.extended_counter_manager_svi_scale
  extended_counter_manager_tunnel_scale                        = local.vxlan.nxos_platform.extended_counter_manager_tunnel_scale
  extended_counter_manager_vlan_scale                          = local.vxlan.nxos_platform.extended_counter_manager_vlan_scale
  extended_counter_manager_voq_scale                           = local.vxlan.nxos_platform.extended_counter_manager_voq_scale
  extended_dme_load_interval                                   = local.vxlan.nxos_platform.extended_dme_load_interval
  extended_egress_l2_qos_ifacl_label_size                      = local.vxlan.nxos_platform.extended_egress_l2_qos_ifacl_label_size
  extended_gpe5_timer_enable                                   = local.vxlan.nxos_platform.extended_gpe5_timer_enable
  extended_hardware_qos_latency_optimized                      = local.vxlan.nxos_platform.extended_hardware_qos_latency_optimized
  extended_ingress_pacl_ifacl_label_size                       = local.vxlan.nxos_platform.extended_ingress_pacl_ifacl_label_size
  extended_ingress_vrf_nat_bd_label_width                      = local.vxlan.nxos_platform.extended_ingress_vrf_nat_bd_label_width
  extended_mpls_qos_pipe_mode                                  = local.vxlan.nxos_platform.extended_mpls_qos_pipe_mode
  extended_multicast_nlb_stick_port_channel                    = local.vxlan.nxos_platform.extended_multicast_nlb_stick_port_channel
  extended_multicast_priority                                  = local.vxlan.nxos_platform.extended_multicast_priority
  extended_multicast_stats_disable                             = local.vxlan.nxos_platform.extended_multicast_stats_disable
  extended_pbr_ecmp_paths                                      = local.vxlan.nxos_platform.extended_pbr_ecmp_paths
  extended_pbr_fast_convergence                                = local.vxlan.nxos_platform.extended_pbr_fast_convergence
  extended_pbr_match_default_route                             = local.vxlan.nxos_platform.extended_pbr_match_default_route
  extended_ptp_correction_hardware                             = local.vxlan.nxos_platform.extended_ptp_correction_hardware
  extended_si_flex_stats                                       = local.vxlan.nxos_platform.extended_si_flex_stats
  extended_stats_template                                      = local.vxlan.nxos_platform.extended_stats_template
  extended_storm_control_priority                              = local.vxlan.nxos_platform.extended_storm_control_priority
  extended_tcam_default_result                                 = local.vxlan.nxos_platform.extended_tcam_default_result
  extended_udf_netflow_rtp_multicast_enabled                   = local.vxlan.nxos_platform.extended_udf_netflow_rtp_multicast_enabled
  extended_vrf_aware_nat_enable                                = local.vxlan.nxos_platform.extended_vrf_aware_nat_enable
  global_tx_span                                               = local.vxlan.nxos_platform.global_tx_span
  hardware_lou_resource_threshold                              = local.vxlan.nxos_platform.hardware_lou_resource_threshold
  hardware_rate_limiter_arp_burst                              = local.vxlan.nxos_platform.hardware_rate_limiter_arp_burst
  hardware_rate_limiter_arp_rate                               = local.vxlan.nxos_platform.hardware_rate_limiter_arp_rate
  hardware_rate_limiter_bpdu_burst                             = local.vxlan.nxos_platform.hardware_rate_limiter_bpdu_burst
  hardware_rate_limiter_bpdu_rate                              = local.vxlan.nxos_platform.hardware_rate_limiter_bpdu_rate
  hardware_rate_limiter_errors_burst                           = local.vxlan.nxos_platform.hardware_rate_limiter_errors_burst
  hardware_rate_limiter_errors_rate                            = local.vxlan.nxos_platform.hardware_rate_limiter_errors_rate
  hardware_rate_limiter_forward_miss_burst                     = local.vxlan.nxos_platform.hardware_rate_limiter_forward_miss_burst
  hardware_rate_limiter_forward_miss_rate                      = local.vxlan.nxos_platform.hardware_rate_limiter_forward_miss_rate
  hardware_rate_limiter_ip_local_burst                         = local.vxlan.nxos_platform.hardware_rate_limiter_ip_local_burst
  hardware_rate_limiter_ip_local_rate                          = local.vxlan.nxos_platform.hardware_rate_limiter_ip_local_rate
  hardware_rate_limiter_mac_learn_burst                        = local.vxlan.nxos_platform.hardware_rate_limiter_mac_learn_burst
  hardware_rate_limiter_mac_learn_rate                         = local.vxlan.nxos_platform.hardware_rate_limiter_mac_learn_rate
  hardware_rate_limiter_mac_local_burst                        = local.vxlan.nxos_platform.hardware_rate_limiter_mac_local_burst
  hardware_rate_limiter_mac_local_rate                         = local.vxlan.nxos_platform.hardware_rate_limiter_mac_local_rate
  hardware_rate_limiter_software_forward_burst                 = local.vxlan.nxos_platform.hardware_rate_limiter_software_forward_burst
  hardware_rate_limiter_software_forward_rate                  = local.vxlan.nxos_platform.hardware_rate_limiter_software_forward_rate
  hardware_rate_limiters                                       = local.vxlan.nxos_platform.hardware_rate_limiters
  high_multicast_priority                                      = local.vxlan.nxos_platform.high_multicast_priority
  ingress_bd_ifacl_label_optimization                          = local.vxlan.nxos_platform.ingress_bd_ifacl_label_optimization
  ingress_racl_size                                            = local.vxlan.nxos_platform.ingress_racl_size
  ingress_replication_round_robin                              = local.vxlan.nxos_platform.ingress_replication_round_robin
  ip_statistics                                                = local.vxlan.nxos_platform.ip_statistics
  ipv6_alpm_carve_value                                        = local.vxlan.nxos_platform.ipv6_alpm_carve_value
  ipv6_lpm_max_entries                                         = local.vxlan.nxos_platform.ipv6_lpm_max_entries
  lpm_max_limit                                                = local.vxlan.nxos_platform.lpm_max_limit
  mld_snooping                                                 = local.vxlan.nxos_platform.mld_snooping
  mpls_adjacency_stats_mode                                    = local.vxlan.nxos_platform.mpls_adjacency_stats_mode
  mpls_ecmp_mode                                               = local.vxlan.nxos_platform.mpls_ecmp_mode
  mrouting_disable_l2_update                                   = local.vxlan.nxos_platform.mrouting_disable_l2_update
  mrouting_disable_second_route_update                         = local.vxlan.nxos_platform.mrouting_disable_second_route_update
  mrouting_performance_mode                                    = local.vxlan.nxos_platform.mrouting_performance_mode
  multicast_dcs_check                                          = local.vxlan.nxos_platform.multicast_dcs_check
  multicast_flex_stats                                         = local.vxlan.nxos_platform.multicast_flex_stats
  multicast_lpm_max_entries                                    = local.vxlan.nxos_platform.multicast_lpm_max_entries
  multicast_max_limit                                          = local.vxlan.nxos_platform.multicast_max_limit
  multicast_nlb                                                = local.vxlan.nxos_platform.multicast_nlb
  multicast_racl_bridge                                        = local.vxlan.nxos_platform.multicast_racl_bridge
  multicast_rpf_check_optimization                             = local.vxlan.nxos_platform.multicast_rpf_check_optimization
  multicast_service_reflect_port                               = local.vxlan.nxos_platform.multicast_service_reflect_port
  multicast_syslog_threshold                                   = local.vxlan.nxos_platform.multicast_syslog_threshold
  nve_interfaces                                               = local.vxlan.nxos_platform.nve_interfaces
  openflow_forward_pdu                                         = local.vxlan.nxos_platform.openflow_forward_pdu
  pbr_skip_self_ip                                             = local.vxlan.nxos_platform.pbr_skip_self_ip
  pfc_watchdog_auto_restore_multiplier                         = local.vxlan.nxos_platform.pfc_watchdog_auto_restore_multiplier
  pfc_watchdog_fixed_restore_multiplier                        = local.vxlan.nxos_platform.pfc_watchdog_fixed_restore_multiplier
  pfc_watchdog_forced_on                                       = local.vxlan.nxos_platform.pfc_watchdog_forced_on
  pfc_watchdog_internal_interface_multiplier                   = local.vxlan.nxos_platform.pfc_watchdog_internal_interface_multiplier
  pfc_watchdog_interval                                        = local.vxlan.nxos_platform.pfc_watchdog_interval
  pfc_watchdog_mode                                            = local.vxlan.nxos_platform.pfc_watchdog_mode
  pfc_watchdog_shutdown_multiplier                             = local.vxlan.nxos_platform.pfc_watchdog_shutdown_multiplier
  pic_core_enable                                              = local.vxlan.nxos_platform.pic_core_enable
  port_channel_fast_convergence                                = local.vxlan.nxos_platform.port_channel_fast_convergence
  port_channel_load_balance_algorithm                          = local.vxlan.nxos_platform.port_channel_load_balance_algorithm
  port_channel_load_balance_concatenation                      = local.vxlan.nxos_platform.port_channel_load_balance_concatenation
  port_channel_load_balance_encapsulation                      = local.vxlan.nxos_platform.port_channel_load_balance_encapsulation
  port_channel_load_balance_fex                                = local.vxlan.nxos_platform.port_channel_load_balance_fex
  port_channel_load_balance_fields                             = local.vxlan.nxos_platform.port_channel_load_balance_fields
  port_channel_load_balance_mpls_label_ip                      = local.vxlan.nxos_platform.port_channel_load_balance_mpls_label_ip
  port_channel_load_balance_mpls_label_only                    = local.vxlan.nxos_platform.port_channel_load_balance_mpls_label_only
  port_channel_load_balance_resilient                          = local.vxlan.nxos_platform.port_channel_load_balance_resilient
  port_channel_load_balance_rotate                             = local.vxlan.nxos_platform.port_channel_load_balance_rotate
  port_channel_load_balance_symmetry                           = local.vxlan.nxos_platform.port_channel_load_balance_symmetry
  port_channel_mpls_load_balance_label_ip                      = local.vxlan.nxos_platform.port_channel_mpls_load_balance_label_ip
  port_channel_mpls_load_balance_label_only                    = local.vxlan.nxos_platform.port_channel_mpls_load_balance_label_only
  port_channel_scale_fanout                                    = local.vxlan.nxos_platform.port_channel_scale_fanout
  profile_front_port_mode                                      = local.vxlan.nxos_platform.profile_front_port_mode
  profile_mode                                                 = local.vxlan.nxos_platform.profile_mode
  profile_tuple                                                = local.vxlan.nxos_platform.profile_tuple
  pstat_configuration                                          = local.vxlan.nxos_platform.pstat_configuration
  qos_afd_profile                                              = local.vxlan.nxos_platform.qos_afd_profile
  qos_buffer_peak_monitor_counter0_class0                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class0
  qos_buffer_peak_monitor_counter0_class1                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class1
  qos_buffer_peak_monitor_counter0_class2                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class2
  qos_buffer_peak_monitor_counter0_class3                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class3
  qos_buffer_peak_monitor_counter0_class4                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class4
  qos_buffer_peak_monitor_counter0_class5                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class5
  qos_buffer_peak_monitor_counter0_class6                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class6
  qos_buffer_peak_monitor_counter0_class7                      = local.vxlan.nxos_platform.qos_buffer_peak_monitor_counter0_class7
  qos_burst_detect_fall_threshold                              = local.vxlan.nxos_platform.qos_burst_detect_fall_threshold
  qos_burst_detect_fall_threshold_unit                         = local.vxlan.nxos_platform.qos_burst_detect_fall_threshold_unit
  qos_burst_detect_max_records                                 = local.vxlan.nxos_platform.qos_burst_detect_max_records
  qos_burst_detect_rise_threshold                              = local.vxlan.nxos_platform.qos_burst_detect_rise_threshold
  qos_burst_detect_rise_threshold_unit                         = local.vxlan.nxos_platform.qos_burst_detect_rise_threshold_unit
  qos_classify_ns_only                                         = local.vxlan.nxos_platform.qos_classify_ns_only
  qos_cpu_size                                                 = local.vxlan.nxos_platform.qos_cpu_size
  qos_dpp_age_period                                           = local.vxlan.nxos_platform.qos_dpp_age_period
  qos_dpp_max_packets                                          = local.vxlan.nxos_platform.qos_dpp_max_packets
  qos_drop_pool_size                                           = local.vxlan.nxos_platform.qos_drop_pool_size
  qos_eoq_stats_class                                          = local.vxlan.nxos_platform.qos_eoq_stats_class
  qos_etrap_age_period                                         = local.vxlan.nxos_platform.qos_etrap_age_period
  qos_etrap_bandwidth_threshold                                = local.vxlan.nxos_platform.qos_etrap_bandwidth_threshold
  qos_etrap_byte_count                                         = local.vxlan.nxos_platform.qos_etrap_byte_count
  qos_headroom_size                                            = local.vxlan.nxos_platform.qos_headroom_size
  qos_include_ipg                                              = local.vxlan.nxos_platform.qos_include_ipg
  qos_input_buffer_peak                                        = local.vxlan.nxos_platform.qos_input_buffer_peak
  qos_lcpu_size                                                = local.vxlan.nxos_platform.qos_lcpu_size
  qos_mac_ipg                                                  = local.vxlan.nxos_platform.qos_mac_ipg
  qos_min_buffer                                               = local.vxlan.nxos_platform.qos_min_buffer
  qos_multicast_qos_group3_traffic                             = local.vxlan.nxos_platform.qos_multicast_qos_group3_traffic
  qos_nodrop_dynamic_queue_limit                               = local.vxlan.nxos_platform.qos_nodrop_dynamic_queue_limit
  qos_nodrop_pg_green_threshold                                = local.vxlan.nxos_platform.qos_nodrop_pg_green_threshold
  qos_nodrop_pg_red_threshold                                  = local.vxlan.nxos_platform.qos_nodrop_pg_red_threshold
  qos_nodrop_pg_size                                           = local.vxlan.nxos_platform.qos_nodrop_pg_size
  qos_nodrop_pg_size_fx                                        = local.vxlan.nxos_platform.qos_nodrop_pg_size_fx
  qos_nodrop_pg_yellow_threshold                               = local.vxlan.nxos_platform.qos_nodrop_pg_yellow_threshold
  qos_nodrop_pool_size                                         = local.vxlan.nxos_platform.qos_nodrop_pool_size
  qos_nodrop_queue_green_threshold                             = local.vxlan.nxos_platform.qos_nodrop_queue_green_threshold
  qos_nodrop_queue_green_threshold_fx                          = local.vxlan.nxos_platform.qos_nodrop_queue_green_threshold_fx
  qos_nodrop_queue_yellow_threshold                            = local.vxlan.nxos_platform.qos_nodrop_queue_yellow_threshold
  qos_nodrop_resume_offset                                     = local.vxlan.nxos_platform.qos_nodrop_resume_offset
  qos_ns_buffer_profile                                        = local.vxlan.nxos_platform.qos_ns_buffer_profile
  qos_output_queue_drops_type                                  = local.vxlan.nxos_platform.qos_output_queue_drops_type
  qos_pfc_multicast_drop                                       = local.vxlan.nxos_platform.qos_pfc_multicast_drop
  qos_pfc_static                                               = local.vxlan.nxos_platform.qos_pfc_static
  qos_pg_headroom_reserve                                      = local.vxlan.nxos_platform.qos_pg_headroom_reserve
  qos_pg_min_value                                             = local.vxlan.nxos_platform.qos_pg_min_value
  qos_pg_no_min                                                = local.vxlan.nxos_platform.qos_pg_no_min
  qos_pg_share                                                 = local.vxlan.nxos_platform.qos_pg_share
  qos_queue_noise_percent                                      = local.vxlan.nxos_platform.qos_queue_noise_percent
  qos_span_size                                                = local.vxlan.nxos_platform.qos_span_size
  routing_mode                                                 = local.vxlan.nxos_platform.routing_mode
  service_template_name                                        = local.vxlan.nxos_platform.service_template_name
  svi_and_si_flex_stats                                        = local.vxlan.nxos_platform.svi_and_si_flex_stats
  svi_flex_stats                                               = local.vxlan.nxos_platform.svi_flex_stats
  switch_mode                                                  = local.vxlan.nxos_platform.switch_mode
  switching_fabric_speed                                       = local.vxlan.nxos_platform.switching_fabric_speed
  switching_mode                                               = local.vxlan.nxos_platform.switching_mode
  system_fabric_mode                                           = local.vxlan.nxos_platform.system_fabric_mode
  tcam_region_arp_acl_size                                     = local.vxlan.nxos_platform.tcam_region_arp_acl_size
  tcam_region_copp_size                                        = local.vxlan.nxos_platform.tcam_region_copp_size
  tcam_region_copp_system_size                                 = local.vxlan.nxos_platform.tcam_region_copp_system_size
  tcam_region_egress_ipv6_qos_size                             = local.vxlan.nxos_platform.tcam_region_egress_ipv6_qos_size
  tcam_region_egress_ipv6_racl_size                            = local.vxlan.nxos_platform.tcam_region_egress_ipv6_racl_size
  tcam_region_egress_mac_qos_size                              = local.vxlan.nxos_platform.tcam_region_egress_mac_qos_size
  tcam_region_egress_qos_lite_size                             = local.vxlan.nxos_platform.tcam_region_egress_qos_lite_size
  tcam_region_egress_qos_size                                  = local.vxlan.nxos_platform.tcam_region_egress_qos_size
  tcam_region_egress_racl_size                                 = local.vxlan.nxos_platform.tcam_region_egress_racl_size
  tcam_region_egress_vacl_size                                 = local.vxlan.nxos_platform.tcam_region_egress_vacl_size
  tcam_region_extended_egress_copp_size                        = local.vxlan.nxos_platform.tcam_region_extended_egress_copp_size
  tcam_region_extended_egress_flow_size                        = local.vxlan.nxos_platform.tcam_region_extended_egress_flow_size
  tcam_region_extended_egress_hardware_telemetry_size          = local.vxlan.nxos_platform.tcam_region_extended_egress_hardware_telemetry_size
  tcam_region_extended_egress_interface_acl_all_per_port_stats = local.vxlan.nxos_platform.tcam_region_extended_egress_interface_acl_all_per_port_stats
  tcam_region_extended_egress_interface_acl_all_size           = local.vxlan.nxos_platform.tcam_region_extended_egress_interface_acl_all_size
  tcam_region_extended_egress_interface_acl_size               = local.vxlan.nxos_platform.tcam_region_extended_egress_interface_acl_size
  tcam_region_extended_egress_ipv6_racl_per_port_stats         = local.vxlan.nxos_platform.tcam_region_extended_egress_ipv6_racl_per_port_stats
  tcam_region_extended_egress_l2_qos_size                      = local.vxlan.nxos_platform.tcam_region_extended_egress_l2_qos_size
  tcam_region_extended_egress_l3_vlan_qos_size                 = local.vxlan.nxos_platform.tcam_region_extended_egress_l3_vlan_qos_size
  tcam_region_extended_egress_racl_per_port_stats              = local.vxlan.nxos_platform.tcam_region_extended_egress_racl_per_port_stats
  tcam_region_extended_egress_racl_size                        = local.vxlan.nxos_platform.tcam_region_extended_egress_racl_size
  tcam_region_extended_egress_sup_size                         = local.vxlan.nxos_platform.tcam_region_extended_egress_sup_size
  tcam_region_extended_hardware_telemetry_size                 = local.vxlan.nxos_platform.tcam_region_extended_hardware_telemetry_size
  tcam_region_extended_ingress_dacl_size                       = local.vxlan.nxos_platform.tcam_region_extended_ingress_dacl_size
  tcam_region_extended_ingress_interface_acl_size              = local.vxlan.nxos_platform.tcam_region_extended_ingress_interface_acl_size
  tcam_region_extended_ingress_interface_acl_wide_size         = local.vxlan.nxos_platform.tcam_region_extended_ingress_interface_acl_wide_size
  tcam_region_extended_ingress_ipv6_interface_acl_lite_size    = local.vxlan.nxos_platform.tcam_region_extended_ingress_ipv6_interface_acl_lite_size
  tcam_region_extended_ingress_l2_l3_qos_size                  = local.vxlan.nxos_platform.tcam_region_extended_ingress_l2_l3_qos_size
  tcam_region_extended_ingress_l2_qos_size                     = local.vxlan.nxos_platform.tcam_region_extended_ingress_l2_qos_size
  tcam_region_extended_ingress_l2_span_filter_size             = local.vxlan.nxos_platform.tcam_region_extended_ingress_l2_span_filter_size
  tcam_region_extended_ingress_l3_span_filter_size             = local.vxlan.nxos_platform.tcam_region_extended_ingress_l3_span_filter_size
  tcam_region_extended_ingress_pacl_sb_size                    = local.vxlan.nxos_platform.tcam_region_extended_ingress_pacl_sb_size
  tcam_region_extended_ingress_racl_size                       = local.vxlan.nxos_platform.tcam_region_extended_ingress_racl_size
  tcam_region_extended_ingress_rbacl_size                      = local.vxlan.nxos_platform.tcam_region_extended_ingress_rbacl_size
  tcam_region_extended_ingress_redirect_size                   = local.vxlan.nxos_platform.tcam_region_extended_ingress_redirect_size
  tcam_region_extended_ingress_storm_control_size              = local.vxlan.nxos_platform.tcam_region_extended_ingress_storm_control_size
  tcam_region_extended_ingress_sup_size                        = local.vxlan.nxos_platform.tcam_region_extended_ingress_sup_size
  tcam_region_extended_ingress_vacl_nh_size                    = local.vxlan.nxos_platform.tcam_region_extended_ingress_vacl_nh_size
  tcam_region_extended_ingress_vlan_qos_size                   = local.vxlan.nxos_platform.tcam_region_extended_ingress_vlan_qos_size
  tcam_region_extended_interface_acl_all_per_port_stats        = local.vxlan.nxos_platform.tcam_region_extended_interface_acl_all_per_port_stats
  tcam_region_extended_interface_acl_all_profile               = local.vxlan.nxos_platform.tcam_region_extended_interface_acl_all_profile
  tcam_region_extended_interface_acl_all_size                  = local.vxlan.nxos_platform.tcam_region_extended_interface_acl_all_size
  tcam_region_extended_interface_acl_per_port_stats            = local.vxlan.nxos_platform.tcam_region_extended_interface_acl_per_port_stats
  tcam_region_extended_ipv6_interface_acl_per_port_stats       = local.vxlan.nxos_platform.tcam_region_extended_ipv6_interface_acl_per_port_stats
  tcam_region_extended_ipv6_racl_per_port_stats                = local.vxlan.nxos_platform.tcam_region_extended_ipv6_racl_per_port_stats
  tcam_region_extended_mac_interface_acl_per_port_stats        = local.vxlan.nxos_platform.tcam_region_extended_mac_interface_acl_per_port_stats
  tcam_region_extended_multicast_nat_size                      = local.vxlan.nxos_platform.tcam_region_extended_multicast_nat_size
  tcam_region_extended_multicast_nbm_size                      = local.vxlan.nxos_platform.tcam_region_extended_multicast_nbm_size
  tcam_region_extended_racl_all_per_port_stats                 = local.vxlan.nxos_platform.tcam_region_extended_racl_all_per_port_stats
  tcam_region_extended_racl_all_profile                        = local.vxlan.nxos_platform.tcam_region_extended_racl_all_profile
  tcam_region_extended_racl_all_size                           = local.vxlan.nxos_platform.tcam_region_extended_racl_all_size
  tcam_region_extended_racl_per_port_stats                     = local.vxlan.nxos_platform.tcam_region_extended_racl_per_port_stats
  tcam_region_extended_redirect_v4_size                        = local.vxlan.nxos_platform.tcam_region_extended_redirect_v4_size
  tcam_region_extended_span_size                               = local.vxlan.nxos_platform.tcam_region_extended_span_size
  tcam_region_extended_span_tahoe_size                         = local.vxlan.nxos_platform.tcam_region_extended_span_tahoe_size
  tcam_region_fcoe_egress_size                                 = local.vxlan.nxos_platform.tcam_region_fcoe_egress_size
  tcam_region_fcoe_ingress_size                                = local.vxlan.nxos_platform.tcam_region_fcoe_ingress_size
  tcam_region_fhs_size                                         = local.vxlan.nxos_platform.tcam_region_fhs_size
  tcam_region_ingress_flow_redirect_size                       = local.vxlan.nxos_platform.tcam_region_ingress_flow_redirect_size
  tcam_region_ingress_flow_size                                = local.vxlan.nxos_platform.tcam_region_ingress_flow_size
  tcam_region_interface_acl_lite_size                          = local.vxlan.nxos_platform.tcam_region_interface_acl_lite_size
  tcam_region_interface_acl_size                               = local.vxlan.nxos_platform.tcam_region_interface_acl_size
  tcam_region_interface_acl_udf_size                           = local.vxlan.nxos_platform.tcam_region_interface_acl_udf_size
  tcam_region_ipsg_size                                        = local.vxlan.nxos_platform.tcam_region_ipsg_size
  tcam_region_ipv6_interface_acl_size                          = local.vxlan.nxos_platform.tcam_region_ipv6_interface_acl_size
  tcam_region_ipv6_l3_qos_size                                 = local.vxlan.nxos_platform.tcam_region_ipv6_l3_qos_size
  tcam_region_ipv6_pbr_size                                    = local.vxlan.nxos_platform.tcam_region_ipv6_pbr_size
  tcam_region_ipv6_qos_size                                    = local.vxlan.nxos_platform.tcam_region_ipv6_qos_size
  tcam_region_ipv6_racl_size                                   = local.vxlan.nxos_platform.tcam_region_ipv6_racl_size
  tcam_region_ipv6_span_l2_size                                = local.vxlan.nxos_platform.tcam_region_ipv6_span_l2_size
  tcam_region_ipv6_span_size                                   = local.vxlan.nxos_platform.tcam_region_ipv6_span_size
  tcam_region_ipv6_sup_size                                    = local.vxlan.nxos_platform.tcam_region_ipv6_sup_size
  tcam_region_ipv6_vacl_size                                   = local.vxlan.nxos_platform.tcam_region_ipv6_vacl_size
  tcam_region_ipv6_vlan_qos_size                               = local.vxlan.nxos_platform.tcam_region_ipv6_vlan_qos_size
  tcam_region_l3_qos_intra_lite_size                           = local.vxlan.nxos_platform.tcam_region_l3_qos_intra_lite_size
  tcam_region_mac_interface_acl_size                           = local.vxlan.nxos_platform.tcam_region_mac_interface_acl_size
  tcam_region_mac_l3_qos_size                                  = local.vxlan.nxos_platform.tcam_region_mac_l3_qos_size
  tcam_region_mac_qos_size                                     = local.vxlan.nxos_platform.tcam_region_mac_qos_size
  tcam_region_mac_vacl_size                                    = local.vxlan.nxos_platform.tcam_region_mac_vacl_size
  tcam_region_mac_vlan_qos_size                                = local.vxlan.nxos_platform.tcam_region_mac_vlan_qos_size
  tcam_region_mpls_doublewide                                  = local.vxlan.nxos_platform.tcam_region_mpls_doublewide
  tcam_region_mpls_size                                        = local.vxlan.nxos_platform.tcam_region_mpls_size
  tcam_region_multicast_bidir_size                             = local.vxlan.nxos_platform.tcam_region_multicast_bidir_size
  tcam_region_mvpn_size                                        = local.vxlan.nxos_platform.tcam_region_mvpn_size
  tcam_region_n9k_arp_acl_size                                 = local.vxlan.nxos_platform.tcam_region_n9k_arp_acl_size
  tcam_region_nat_size                                         = local.vxlan.nxos_platform.tcam_region_nat_size
  tcam_region_openflow_doublewide                              = local.vxlan.nxos_platform.tcam_region_openflow_doublewide
  tcam_region_openflow_lite_size                               = local.vxlan.nxos_platform.tcam_region_openflow_lite_size
  tcam_region_openflow_size                                    = local.vxlan.nxos_platform.tcam_region_openflow_size
  tcam_region_pbr_size                                         = local.vxlan.nxos_platform.tcam_region_pbr_size
  tcam_region_qos_intra_lite_size                              = local.vxlan.nxos_platform.tcam_region_qos_intra_lite_size
  tcam_region_qos_label_size                                   = local.vxlan.nxos_platform.tcam_region_qos_label_size
  tcam_region_qos_size                                         = local.vxlan.nxos_platform.tcam_region_qos_size
  tcam_region_racl_lite_size                                   = local.vxlan.nxos_platform.tcam_region_racl_lite_size
  tcam_region_racl_size                                        = local.vxlan.nxos_platform.tcam_region_racl_size
  tcam_region_racl_udf_size                                    = local.vxlan.nxos_platform.tcam_region_racl_udf_size
  tcam_region_sup_size                                         = local.vxlan.nxos_platform.tcam_region_sup_size
  tcam_region_svi_size                                         = local.vxlan.nxos_platform.tcam_region_svi_size
  tcam_region_tcp_nat_size                                     = local.vxlan.nxos_platform.tcam_region_tcp_nat_size
  tcam_region_vacl_lite_size                                   = local.vxlan.nxos_platform.tcam_region_vacl_lite_size
  tcam_region_vacl_size                                        = local.vxlan.nxos_platform.tcam_region_vacl_size
  tcam_region_vlan_qos_intra_lite_size                         = local.vxlan.nxos_platform.tcam_region_vlan_qos_intra_lite_size
  tcam_region_vlan_qos_size                                    = local.vxlan.nxos_platform.tcam_region_vlan_qos_size
  tcam_region_vpc_convergence_size                             = local.vxlan.nxos_platform.tcam_region_vpc_convergence_size
  tcam_region_vxlan_p2p_size                                   = local.vxlan.nxos_platform.tcam_region_vxlan_p2p_size
  tcam_syslog_threshold                                        = local.vxlan.nxos_platform.tcam_syslog_threshold
  tcam_templates                                               = local.vxlan.nxos_platform.tcam_templates
  udf_description                                              = local.vxlan.nxos_platform.udf_description
  udfs                                                         = local.vxlan.nxos_platform.udfs
  unicast_max_limit                                            = local.vxlan.nxos_platform.unicast_max_limit
  unicast_syslog_threshold                                     = local.vxlan.nxos_platform.unicast_syslog_threshold
  unicast_trace                                                = local.vxlan.nxos_platform.unicast_trace
  unknown_unicast_flood                                        = local.vxlan.nxos_platform.unknown_unicast_flood
  urpf_status                                                  = local.vxlan.nxos_platform.urpf_status
  wrr_unicast_bandwidth                                        = local.vxlan.nxos_platform.wrr_unicast_bandwidth
  depends_on                                                   = [nxos_system.this]
}

# 004 1. Global, fabric and features
resource "ndfc_fabric_vxlan_evpn" "this" {
  aaa_remote_ip_enabled                       = local.vxlan.ndfc_fabric_vxlan_evpn.aaa_remote_ip_enabled
  aaa_server_conf                             = local.vxlan.ndfc_fabric_vxlan_evpn.aaa_server_conf
  active_migration                            = local.vxlan.ndfc_fabric_vxlan_evpn.active_migration
  advertise_pip_bgp                           = local.vxlan.ndfc_fabric_vxlan_evpn.advertise_pip_bgp
  advertise_pip_on_border                     = local.vxlan.ndfc_fabric_vxlan_evpn.advertise_pip_on_border
  agent_intf                                  = local.vxlan.ndfc_fabric_vxlan_evpn.agent_intf
  agg_acc_vpc_po_id_range                     = local.vxlan.ndfc_fabric_vxlan_evpn.agg_acc_vpc_po_id_range
  ai_ml_qos_policy                            = local.vxlan.ndfc_fabric_vxlan_evpn.ai_ml_qos_policy
  allow_l3vni_no_vlan                         = local.vxlan.ndfc_fabric_vxlan_evpn.allow_l3vni_no_vlan
  allow_nxc                                   = local.vxlan.ndfc_fabric_vxlan_evpn.allow_nxc
  anycast_bgw_advertise_pip                   = local.vxlan.ndfc_fabric_vxlan_evpn.anycast_bgw_advertise_pip
  anycast_gw_mac                              = local.vxlan.ndfc_fabric_vxlan_evpn.anycast_gw_mac
  anycast_lb_id                               = local.vxlan.ndfc_fabric_vxlan_evpn.anycast_lb_id
  anycast_rp_ip_range                         = local.vxlan.ndfc_fabric_vxlan_evpn.anycast_rp_ip_range
  auto_symmetric_default_vrf                  = local.vxlan.ndfc_fabric_vxlan_evpn.auto_symmetric_default_vrf
  auto_symmetric_vrf_lite                     = local.vxlan.ndfc_fabric_vxlan_evpn.auto_symmetric_vrf_lite
  auto_unique_vrf_lite_ip_prefix              = local.vxlan.ndfc_fabric_vxlan_evpn.auto_unique_vrf_lite_ip_prefix
  auto_vrflite_ifc_default_vrf                = local.vxlan.ndfc_fabric_vxlan_evpn.auto_vrflite_ifc_default_vrf
  banner                                      = local.vxlan.ndfc_fabric_vxlan_evpn.banner
  bfd_auth_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_auth_enable
  bfd_auth_key                                = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_auth_key
  bfd_auth_key_id                             = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_auth_key_id
  bfd_enable                                  = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_enable
  bfd_ibgp_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_ibgp_enable
  bfd_isis_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_isis_enable
  bfd_ospf_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_ospf_enable
  bfd_pim_enable                              = local.vxlan.ndfc_fabric_vxlan_evpn.bfd_pim_enable
  bgp_as                                      = local.vxlan.ndfc_fabric_vxlan_evpn.bgp_as
  bgp_auth_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.bgp_auth_enable
  bgp_auth_key                                = local.vxlan.ndfc_fabric_vxlan_evpn.bgp_auth_key
  bgp_auth_key_type                           = local.vxlan.ndfc_fabric_vxlan_evpn.bgp_auth_key_type
  bgp_lb_id                                   = local.vxlan.ndfc_fabric_vxlan_evpn.bgp_lb_id
  bootstrap_conf                              = local.vxlan.ndfc_fabric_vxlan_evpn.bootstrap_conf
  bootstrap_enable                            = local.vxlan.ndfc_fabric_vxlan_evpn.bootstrap_enable
  bootstrap_multisubnet                       = local.vxlan.ndfc_fabric_vxlan_evpn.bootstrap_multisubnet
  brfield_debug_flag                          = local.vxlan.ndfc_fabric_vxlan_evpn.brfield_debug_flag
  brownfield_network_name_format              = local.vxlan.ndfc_fabric_vxlan_evpn.brownfield_network_name_format
  brownfield_skip_overlay_network_attachments = local.vxlan.ndfc_fabric_vxlan_evpn.brownfield_skip_overlay_network_attachments
  cdp_enable                                  = local.vxlan.ndfc_fabric_vxlan_evpn.cdp_enable
  copp_policy                                 = local.vxlan.ndfc_fabric_vxlan_evpn.copp_policy
  dci_macsec_algorithm                        = local.vxlan.ndfc_fabric_vxlan_evpn.dci_macsec_algorithm
  dci_macsec_cipher_suite                     = local.vxlan.ndfc_fabric_vxlan_evpn.dci_macsec_cipher_suite
  dci_macsec_fallback_algorithm               = local.vxlan.ndfc_fabric_vxlan_evpn.dci_macsec_fallback_algorithm
  dci_macsec_fallback_key_string              = local.vxlan.ndfc_fabric_vxlan_evpn.dci_macsec_fallback_key_string
  dci_macsec_key_string                       = local.vxlan.ndfc_fabric_vxlan_evpn.dci_macsec_key_string
  dci_subnet_range                            = local.vxlan.ndfc_fabric_vxlan_evpn.dci_subnet_range
  dci_subnet_target_mask                      = local.vxlan.ndfc_fabric_vxlan_evpn.dci_subnet_target_mask
  default_network                             = local.vxlan.ndfc_fabric_vxlan_evpn.default_network
  default_pvlan_sec_network                   = local.vxlan.ndfc_fabric_vxlan_evpn.default_pvlan_sec_network
  default_queuing_policy_cloudscale           = local.vxlan.ndfc_fabric_vxlan_evpn.default_queuing_policy_cloudscale
  default_queuing_policy_other                = local.vxlan.ndfc_fabric_vxlan_evpn.default_queuing_policy_other
  default_queuing_policy_r_series             = local.vxlan.ndfc_fabric_vxlan_evpn.default_queuing_policy_r_series
  default_vrf                                 = local.vxlan.ndfc_fabric_vxlan_evpn.default_vrf
  default_vrf_redis_bgp_rmap                  = local.vxlan.ndfc_fabric_vxlan_evpn.default_vrf_redis_bgp_rmap
  deploy                                      = local.vxlan.ndfc_fabric_vxlan_evpn.deploy
  deployment_freeze                           = local.vxlan.ndfc_fabric_vxlan_evpn.deployment_freeze
  dhcp_enable                                 = local.vxlan.ndfc_fabric_vxlan_evpn.dhcp_enable
  dhcp_end                                    = local.vxlan.ndfc_fabric_vxlan_evpn.dhcp_end
  dhcp_ipv6_enable                            = local.vxlan.ndfc_fabric_vxlan_evpn.dhcp_ipv6_enable
  dhcp_start                                  = local.vxlan.ndfc_fabric_vxlan_evpn.dhcp_start
  dns_server_ip_list                          = local.vxlan.ndfc_fabric_vxlan_evpn.dns_server_ip_list
  dns_server_vrf                              = local.vxlan.ndfc_fabric_vxlan_evpn.dns_server_vrf
  enable_aaa                                  = local.vxlan.ndfc_fabric_vxlan_evpn.enable_aaa
  enable_agent                                = local.vxlan.ndfc_fabric_vxlan_evpn.enable_agent
  enable_agg_acc_id_range                     = local.vxlan.ndfc_fabric_vxlan_evpn.enable_agg_acc_id_range
  enable_ai_ml_qos_policy                     = local.vxlan.ndfc_fabric_vxlan_evpn.enable_ai_ml_qos_policy
  enable_dci_macsec                           = local.vxlan.ndfc_fabric_vxlan_evpn.enable_dci_macsec
  enable_default_queuing_policy               = local.vxlan.ndfc_fabric_vxlan_evpn.enable_default_queuing_policy
  enable_fabric_vpc_domain_id                 = local.vxlan.ndfc_fabric_vxlan_evpn.enable_fabric_vpc_domain_id
  enable_l3vni_no_vlan                        = local.vxlan.ndfc_fabric_vxlan_evpn.enable_l3vni_no_vlan
  enable_macsec                               = local.vxlan.ndfc_fabric_vxlan_evpn.enable_macsec
  enable_netflow                              = local.vxlan.ndfc_fabric_vxlan_evpn.enable_netflow
  enable_ngoam                                = local.vxlan.ndfc_fabric_vxlan_evpn.enable_ngoam
  enable_nxapi                                = local.vxlan.ndfc_fabric_vxlan_evpn.enable_nxapi
  enable_nxapi_http                           = local.vxlan.ndfc_fabric_vxlan_evpn.enable_nxapi_http
  enable_pbr                                  = local.vxlan.ndfc_fabric_vxlan_evpn.enable_pbr
  enable_pvlan                                = local.vxlan.ndfc_fabric_vxlan_evpn.enable_pvlan
  enable_qkd                                  = local.vxlan.ndfc_fabric_vxlan_evpn.enable_qkd
  enable_real_time_backup                     = local.vxlan.ndfc_fabric_vxlan_evpn.enable_real_time_backup
  enable_rt_intf_stats                        = local.vxlan.ndfc_fabric_vxlan_evpn.enable_rt_intf_stats
  enable_scheduled_backup                     = local.vxlan.ndfc_fabric_vxlan_evpn.enable_scheduled_backup
  enable_sgt                                  = local.vxlan.ndfc_fabric_vxlan_evpn.enable_sgt
  enable_tenant_dhcp                          = local.vxlan.ndfc_fabric_vxlan_evpn.enable_tenant_dhcp
  enable_trm                                  = local.vxlan.ndfc_fabric_vxlan_evpn.enable_trm
  enable_trmv6                                = local.vxlan.ndfc_fabric_vxlan_evpn.enable_trmv6
  enable_vpc_peer_link_native_vlan            = local.vxlan.ndfc_fabric_vxlan_evpn.enable_vpc_peer_link_native_vlan
  enable_vri_id_realloc                       = local.vxlan.ndfc_fabric_vxlan_evpn.enable_vri_id_realloc
  esr_option                                  = local.vxlan.ndfc_fabric_vxlan_evpn.esr_option
  ext_fabric_type                             = local.vxlan.ndfc_fabric_vxlan_evpn.ext_fabric_type
  extra_conf_intra_links                      = local.vxlan.ndfc_fabric_vxlan_evpn.extra_conf_intra_links
  extra_conf_leaf                             = local.vxlan.ndfc_fabric_vxlan_evpn.extra_conf_leaf
  extra_conf_spine                            = local.vxlan.ndfc_fabric_vxlan_evpn.extra_conf_spine
  extra_conf_tor                              = local.vxlan.ndfc_fabric_vxlan_evpn.extra_conf_tor
  fabric_interface_type                       = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_interface_type
  fabric_mtu                                  = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_mtu
  fabric_name                                 = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_name
  fabric_vpc_domain_id                        = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_vpc_domain_id
  fabric_vpc_qos                              = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_vpc_qos
  fabric_vpc_qos_policy_name                  = local.vxlan.ndfc_fabric_vxlan_evpn.fabric_vpc_qos_policy_name
  feature_ptp                                 = local.vxlan.ndfc_fabric_vxlan_evpn.feature_ptp
  ff                                          = local.vxlan.ndfc_fabric_vxlan_evpn.ff
  grfield_debug_flag                          = local.vxlan.ndfc_fabric_vxlan_evpn.grfield_debug_flag
  hd_time                                     = local.vxlan.ndfc_fabric_vxlan_evpn.hd_time
  host_intf_admin_state                       = local.vxlan.ndfc_fabric_vxlan_evpn.host_intf_admin_state
  ibgp_peer_template                          = local.vxlan.ndfc_fabric_vxlan_evpn.ibgp_peer_template
  ibgp_peer_template_leaf                     = local.vxlan.ndfc_fabric_vxlan_evpn.ibgp_peer_template_leaf
  ignore_cert                                 = local.vxlan.ndfc_fabric_vxlan_evpn.ignore_cert
  inband_dhcp_servers                         = local.vxlan.ndfc_fabric_vxlan_evpn.inband_dhcp_servers
  inband_mgmt                                 = local.vxlan.ndfc_fabric_vxlan_evpn.inband_mgmt
  intf_stat_load_interval                     = local.vxlan.ndfc_fabric_vxlan_evpn.intf_stat_load_interval
  ipv6_anycast_rp_ip_range                    = local.vxlan.ndfc_fabric_vxlan_evpn.ipv6_anycast_rp_ip_range
  ipv6_multicast_group_subnet                 = local.vxlan.ndfc_fabric_vxlan_evpn.ipv6_multicast_group_subnet
  isis_area_num                               = local.vxlan.ndfc_fabric_vxlan_evpn.isis_area_num
  isis_auth_enable                            = local.vxlan.ndfc_fabric_vxlan_evpn.isis_auth_enable
  isis_auth_key                               = local.vxlan.ndfc_fabric_vxlan_evpn.isis_auth_key
  isis_auth_keychain_key_id                   = local.vxlan.ndfc_fabric_vxlan_evpn.isis_auth_keychain_key_id
  isis_auth_keychain_name                     = local.vxlan.ndfc_fabric_vxlan_evpn.isis_auth_keychain_name
  isis_level                                  = local.vxlan.ndfc_fabric_vxlan_evpn.isis_level
  isis_overload_elapse_time                   = local.vxlan.ndfc_fabric_vxlan_evpn.isis_overload_elapse_time
  isis_overload_enable                        = local.vxlan.ndfc_fabric_vxlan_evpn.isis_overload_enable
  isis_p2p_enable                             = local.vxlan.ndfc_fabric_vxlan_evpn.isis_p2p_enable
  kme_server_ip                               = local.vxlan.ndfc_fabric_vxlan_evpn.kme_server_ip
  kme_server_port                             = local.vxlan.ndfc_fabric_vxlan_evpn.kme_server_port
  l2_host_intf_mtu                            = local.vxlan.ndfc_fabric_vxlan_evpn.l2_host_intf_mtu
  l2_segment_id_range                         = local.vxlan.ndfc_fabric_vxlan_evpn.l2_segment_id_range
  l3_partition_id_range                       = local.vxlan.ndfc_fabric_vxlan_evpn.l3_partition_id_range
  l3vni_ipv6_mcast_group                      = local.vxlan.ndfc_fabric_vxlan_evpn.l3vni_ipv6_mcast_group
  l3vni_mcast_group                           = local.vxlan.ndfc_fabric_vxlan_evpn.l3vni_mcast_group
  link_state_routing                          = local.vxlan.ndfc_fabric_vxlan_evpn.link_state_routing
  link_state_routing_tag                      = local.vxlan.ndfc_fabric_vxlan_evpn.link_state_routing_tag
  loopback0_ip_range                          = local.vxlan.ndfc_fabric_vxlan_evpn.loopback0_ip_range
  loopback0_ipv6_range                        = local.vxlan.ndfc_fabric_vxlan_evpn.loopback0_ipv6_range
  loopback1_ip_range                          = local.vxlan.ndfc_fabric_vxlan_evpn.loopback1_ip_range
  loopback1_ipv6_range                        = local.vxlan.ndfc_fabric_vxlan_evpn.loopback1_ipv6_range
  macsec_algorithm                            = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_algorithm
  macsec_cipher_suite                         = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_cipher_suite
  macsec_fallback_algorithm                   = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_fallback_algorithm
  macsec_fallback_key_string                  = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_fallback_key_string
  macsec_key_string                           = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_key_string
  macsec_report_timer                         = local.vxlan.ndfc_fabric_vxlan_evpn.macsec_report_timer
  mgmt_gw                                     = local.vxlan.ndfc_fabric_vxlan_evpn.mgmt_gw
  mgmt_prefix                                 = local.vxlan.ndfc_fabric_vxlan_evpn.mgmt_prefix
  mgmt_v6prefix                               = local.vxlan.ndfc_fabric_vxlan_evpn.mgmt_v6prefix
  mpls_handoff                                = local.vxlan.ndfc_fabric_vxlan_evpn.mpls_handoff
  mpls_isis_area_num                          = local.vxlan.ndfc_fabric_vxlan_evpn.mpls_isis_area_num
  mpls_lb_id                                  = local.vxlan.ndfc_fabric_vxlan_evpn.mpls_lb_id
  mpls_loopback_ip_range                      = local.vxlan.ndfc_fabric_vxlan_evpn.mpls_loopback_ip_range
  mst_instance_range                          = local.vxlan.ndfc_fabric_vxlan_evpn.mst_instance_range
  multicast_group_subnet                      = local.vxlan.ndfc_fabric_vxlan_evpn.multicast_group_subnet
  mvpn_vri_id_range                           = local.vxlan.ndfc_fabric_vxlan_evpn.mvpn_vri_id_range
  netflow_exporter_list                       = local.vxlan.ndfc_fabric_vxlan_evpn.netflow_exporter_list
  netflow_monitor_list                        = local.vxlan.ndfc_fabric_vxlan_evpn.netflow_monitor_list
  netflow_record_list                         = local.vxlan.ndfc_fabric_vxlan_evpn.netflow_record_list
  network_extension_template                  = local.vxlan.ndfc_fabric_vxlan_evpn.network_extension_template
  network_vlan_range                          = local.vxlan.ndfc_fabric_vxlan_evpn.network_vlan_range
  ntp_server_ip_list                          = local.vxlan.ndfc_fabric_vxlan_evpn.ntp_server_ip_list
  ntp_server_vrf                              = local.vxlan.ndfc_fabric_vxlan_evpn.ntp_server_vrf
  nve_lb_id                                   = local.vxlan.ndfc_fabric_vxlan_evpn.nve_lb_id
  nxapi_http_port                             = local.vxlan.ndfc_fabric_vxlan_evpn.nxapi_http_port
  nxapi_https_port                            = local.vxlan.ndfc_fabric_vxlan_evpn.nxapi_https_port
  nxc_dest_vrf                                = local.vxlan.ndfc_fabric_vxlan_evpn.nxc_dest_vrf
  nxc_proxy_port                              = local.vxlan.ndfc_fabric_vxlan_evpn.nxc_proxy_port
  nxc_proxy_server                            = local.vxlan.ndfc_fabric_vxlan_evpn.nxc_proxy_server
  nxc_src_intf                                = local.vxlan.ndfc_fabric_vxlan_evpn.nxc_src_intf
  object_tracking_number_range                = local.vxlan.ndfc_fabric_vxlan_evpn.object_tracking_number_range
  ospf_area_id                                = local.vxlan.ndfc_fabric_vxlan_evpn.ospf_area_id
  ospf_auth_enable                            = local.vxlan.ndfc_fabric_vxlan_evpn.ospf_auth_enable
  ospf_auth_key                               = local.vxlan.ndfc_fabric_vxlan_evpn.ospf_auth_key
  ospf_auth_key_id                            = local.vxlan.ndfc_fabric_vxlan_evpn.ospf_auth_key_id
  overlay_mode                                = local.vxlan.ndfc_fabric_vxlan_evpn.overlay_mode
  overwrite_global_nxc                        = local.vxlan.ndfc_fabric_vxlan_evpn.overwrite_global_nxc
  per_vrf_loopback_auto_provision             = local.vxlan.ndfc_fabric_vxlan_evpn.per_vrf_loopback_auto_provision
  per_vrf_loopback_auto_provision_v6          = local.vxlan.ndfc_fabric_vxlan_evpn.per_vrf_loopback_auto_provision_v6
  per_vrf_loopback_ip_range                   = local.vxlan.ndfc_fabric_vxlan_evpn.per_vrf_loopback_ip_range
  per_vrf_loopback_ip_range_v6                = local.vxlan.ndfc_fabric_vxlan_evpn.per_vrf_loopback_ip_range_v6
  pfc_watch_int                               = local.vxlan.ndfc_fabric_vxlan_evpn.pfc_watch_int
  phantom_rp_lb_id1                           = local.vxlan.ndfc_fabric_vxlan_evpn.phantom_rp_lb_id1
  phantom_rp_lb_id2                           = local.vxlan.ndfc_fabric_vxlan_evpn.phantom_rp_lb_id2
  phantom_rp_lb_id3                           = local.vxlan.ndfc_fabric_vxlan_evpn.phantom_rp_lb_id3
  phantom_rp_lb_id4                           = local.vxlan.ndfc_fabric_vxlan_evpn.phantom_rp_lb_id4
  pim_hello_auth_enable                       = local.vxlan.ndfc_fabric_vxlan_evpn.pim_hello_auth_enable
  pim_hello_auth_key                          = local.vxlan.ndfc_fabric_vxlan_evpn.pim_hello_auth_key
  pm_enable                                   = local.vxlan.ndfc_fabric_vxlan_evpn.pm_enable
  power_redundancy_mode                       = local.vxlan.ndfc_fabric_vxlan_evpn.power_redundancy_mode
  ptp_domain_id                               = local.vxlan.ndfc_fabric_vxlan_evpn.ptp_domain_id
  ptp_lb_id                                   = local.vxlan.ndfc_fabric_vxlan_evpn.ptp_lb_id
  ptp_vlan_id                                 = local.vxlan.ndfc_fabric_vxlan_evpn.ptp_vlan_id
  qkd_profile_name                            = local.vxlan.ndfc_fabric_vxlan_evpn.qkd_profile_name
  replication_mode                            = local.vxlan.ndfc_fabric_vxlan_evpn.replication_mode
  route_map_sequence_number_range             = local.vxlan.ndfc_fabric_vxlan_evpn.route_map_sequence_number_range
  router_id_range                             = local.vxlan.ndfc_fabric_vxlan_evpn.router_id_range
  rp_count                                    = local.vxlan.ndfc_fabric_vxlan_evpn.rp_count
  rp_lb_id                                    = local.vxlan.ndfc_fabric_vxlan_evpn.rp_lb_id
  rp_mode                                     = local.vxlan.ndfc_fabric_vxlan_evpn.rp_mode
  rr_count                                    = local.vxlan.ndfc_fabric_vxlan_evpn.rr_count
  scheduled_time                              = local.vxlan.ndfc_fabric_vxlan_evpn.scheduled_time
  seed_switch_core_interfaces                 = local.vxlan.ndfc_fabric_vxlan_evpn.seed_switch_core_interfaces
  service_network_vlan_range                  = local.vxlan.ndfc_fabric_vxlan_evpn.service_network_vlan_range
  sgt_id_range                                = local.vxlan.ndfc_fabric_vxlan_evpn.sgt_id_range
  sgt_name_prefix                             = local.vxlan.ndfc_fabric_vxlan_evpn.sgt_name_prefix
  sgt_preprovision                            = local.vxlan.ndfc_fabric_vxlan_evpn.sgt_preprovision
  site_id                                     = local.vxlan.ndfc_fabric_vxlan_evpn.site_id
  sla_id_range                                = local.vxlan.ndfc_fabric_vxlan_evpn.sla_id_range
  snmp_server_host_trap                       = local.vxlan.ndfc_fabric_vxlan_evpn.snmp_server_host_trap
  spine_switch_core_interfaces                = local.vxlan.ndfc_fabric_vxlan_evpn.spine_switch_core_interfaces
  sspine_add_del_debug_flag                   = local.vxlan.ndfc_fabric_vxlan_evpn.sspine_add_del_debug_flag
  static_underlay_ip_alloc                    = local.vxlan.ndfc_fabric_vxlan_evpn.static_underlay_ip_alloc
  stp_bridge_priority                         = local.vxlan.ndfc_fabric_vxlan_evpn.stp_bridge_priority
  stp_root_option                             = local.vxlan.ndfc_fabric_vxlan_evpn.stp_root_option
  stp_vlan_range                              = local.vxlan.ndfc_fabric_vxlan_evpn.stp_vlan_range
  strict_cc_mode                              = local.vxlan.ndfc_fabric_vxlan_evpn.strict_cc_mode
  subinterface_range                          = local.vxlan.ndfc_fabric_vxlan_evpn.subinterface_range
  subnet_range                                = local.vxlan.ndfc_fabric_vxlan_evpn.subnet_range
  subnet_target_mask                          = local.vxlan.ndfc_fabric_vxlan_evpn.subnet_target_mask
  syslog_server_ip_list                       = local.vxlan.ndfc_fabric_vxlan_evpn.syslog_server_ip_list
  syslog_server_vrf                           = local.vxlan.ndfc_fabric_vxlan_evpn.syslog_server_vrf
  syslog_sev                                  = local.vxlan.ndfc_fabric_vxlan_evpn.syslog_sev
  tcam_allocation                             = local.vxlan.ndfc_fabric_vxlan_evpn.tcam_allocation
  trustpoint_label                            = local.vxlan.ndfc_fabric_vxlan_evpn.trustpoint_label
  underlay_is_v6                              = local.vxlan.ndfc_fabric_vxlan_evpn.underlay_is_v6
  unnum_bootstrap_lb_id                       = local.vxlan.ndfc_fabric_vxlan_evpn.unnum_bootstrap_lb_id
  use_link_local                              = local.vxlan.ndfc_fabric_vxlan_evpn.use_link_local
  v6_subnet_range                             = local.vxlan.ndfc_fabric_vxlan_evpn.v6_subnet_range
  v6_subnet_target_mask                       = local.vxlan.ndfc_fabric_vxlan_evpn.v6_subnet_target_mask
  vpc_auto_recovery_time                      = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_auto_recovery_time
  vpc_delay_restore                           = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_delay_restore
  vpc_delay_restore_time                      = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_delay_restore_time
  vpc_domain_id_range                         = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_domain_id_range
  vpc_enable_ipv6_nd_sync                     = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_enable_ipv6_nd_sync
  vpc_peer_keep_alive_option                  = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_peer_keep_alive_option
  vpc_peer_link_po                            = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_peer_link_po
  vpc_peer_link_vlan                          = local.vxlan.ndfc_fabric_vxlan_evpn.vpc_peer_link_vlan
  vrf_extension_template                      = local.vxlan.ndfc_fabric_vxlan_evpn.vrf_extension_template
  vrf_lite_autoconfig                         = local.vxlan.ndfc_fabric_vxlan_evpn.vrf_lite_autoconfig
  vrf_vlan_range                              = local.vxlan.ndfc_fabric_vxlan_evpn.vrf_vlan_range
}

# 005 1. Global, fabric and features
resource "ndfc_fabric_vxlan_msd" "this" {
  anycast_gw_mac                 = local.vxlan.ndfc_fabric_vxlan_msd.anycast_gw_mac
  bgp_rp_asn                     = local.vxlan.ndfc_fabric_vxlan_msd.bgp_rp_asn
  bgw_routing_tag                = local.vxlan.ndfc_fabric_vxlan_msd.bgw_routing_tag
  border_gwy_connections         = local.vxlan.ndfc_fabric_vxlan_msd.border_gwy_connections
  child_fabrics                  = local.vxlan.ndfc_fabric_vxlan_msd.child_fabrics
  cloudsec_algorithm             = local.vxlan.ndfc_fabric_vxlan_msd.cloudsec_algorithm
  cloudsec_autoconfig            = local.vxlan.ndfc_fabric_vxlan_msd.cloudsec_autoconfig
  cloudsec_enforcement           = local.vxlan.ndfc_fabric_vxlan_msd.cloudsec_enforcement
  cloudsec_key_string            = local.vxlan.ndfc_fabric_vxlan_msd.cloudsec_key_string
  cloudsec_report_timer          = local.vxlan.ndfc_fabric_vxlan_msd.cloudsec_report_timer
  dci_subnet_range               = local.vxlan.ndfc_fabric_vxlan_msd.dci_subnet_range
  dci_subnet_target_mask         = local.vxlan.ndfc_fabric_vxlan_msd.dci_subnet_target_mask
  default_network                = local.vxlan.ndfc_fabric_vxlan_msd.default_network
  default_pvlan_sec_network      = local.vxlan.ndfc_fabric_vxlan_msd.default_pvlan_sec_network
  default_vrf                    = local.vxlan.ndfc_fabric_vxlan_msd.default_vrf
  delay_restore                  = local.vxlan.ndfc_fabric_vxlan_msd.delay_restore
  deploy                         = local.vxlan.ndfc_fabric_vxlan_msd.deploy
  enable_bgp_bfd                 = local.vxlan.ndfc_fabric_vxlan_msd.enable_bgp_bfd
  enable_bgp_log_neighbor_change = local.vxlan.ndfc_fabric_vxlan_msd.enable_bgp_log_neighbor_change
  enable_bgp_send_comm           = local.vxlan.ndfc_fabric_vxlan_msd.enable_bgp_send_comm
  enable_pvlan                   = local.vxlan.ndfc_fabric_vxlan_msd.enable_pvlan
  enable_rs_redist_direct        = local.vxlan.ndfc_fabric_vxlan_msd.enable_rs_redist_direct
  enable_scheduled_backup        = local.vxlan.ndfc_fabric_vxlan_msd.enable_scheduled_backup
  enable_sgt                     = local.vxlan.ndfc_fabric_vxlan_msd.enable_sgt
  enable_trm_trmv6               = local.vxlan.ndfc_fabric_vxlan_msd.enable_trm_trmv6
  ext_fabric_type                = local.vxlan.ndfc_fabric_vxlan_msd.ext_fabric_type
  fabric_name                    = local.vxlan.ndfc_fabric_vxlan_msd.fabric_name
  ff                             = local.vxlan.ndfc_fabric_vxlan_msd.ff
  l2_segment_id_range            = local.vxlan.ndfc_fabric_vxlan_msd.l2_segment_id_range
  l3_partition_id_range          = local.vxlan.ndfc_fabric_vxlan_msd.l3_partition_id_range
  loopback100_ip_range           = local.vxlan.ndfc_fabric_vxlan_msd.loopback100_ip_range
  loopback100_ipv6_range         = local.vxlan.ndfc_fabric_vxlan_msd.loopback100_ipv6_range
  ms_ifc_bgp_auth_key_type       = local.vxlan.ndfc_fabric_vxlan_msd.ms_ifc_bgp_auth_key_type
  ms_ifc_bgp_password            = local.vxlan.ndfc_fabric_vxlan_msd.ms_ifc_bgp_password
  ms_ifc_bgp_password_enable     = local.vxlan.ndfc_fabric_vxlan_msd.ms_ifc_bgp_password_enable
  ms_loopback_id                 = local.vxlan.ndfc_fabric_vxlan_msd.ms_loopback_id
  ms_underlay_autoconfig         = local.vxlan.ndfc_fabric_vxlan_msd.ms_underlay_autoconfig
  network_extension_template     = local.vxlan.ndfc_fabric_vxlan_msd.network_extension_template
  rp_server_ip                   = local.vxlan.ndfc_fabric_vxlan_msd.rp_server_ip
  rs_routing_tag                 = local.vxlan.ndfc_fabric_vxlan_msd.rs_routing_tag
  scheduled_time                 = local.vxlan.ndfc_fabric_vxlan_msd.scheduled_time
  sgt_id_range                   = local.vxlan.ndfc_fabric_vxlan_msd.sgt_id_range
  sgt_name_prefix                = local.vxlan.ndfc_fabric_vxlan_msd.sgt_name_prefix
  sgt_preprovision               = local.vxlan.ndfc_fabric_vxlan_msd.sgt_preprovision
  tor_auto_deploy                = local.vxlan.ndfc_fabric_vxlan_msd.tor_auto_deploy
  v6_dci_subnet_range            = local.vxlan.ndfc_fabric_vxlan_msd.v6_dci_subnet_range
  v6_dci_subnet_target_mask      = local.vxlan.ndfc_fabric_vxlan_msd.v6_dci_subnet_target_mask
  vrf_extension_template         = local.vxlan.ndfc_fabric_vxlan_msd.vrf_extension_template
  vxlan_underlay_is_v6           = local.vxlan.ndfc_fabric_vxlan_msd.vxlan_underlay_is_v6
  depends_on                     = [ndfc_fabric_vxlan_evpn.this]
}

# 006 1. Global, fabric and features
resource "ndfc_fabric_msite_ext_net" "this" {
  aaa_remote_ip_enabled   = local.vxlan.ndfc_fabric_msite_ext_net.aaa_remote_ip_enabled
  aaa_server_conf         = local.vxlan.ndfc_fabric_msite_ext_net.aaa_server_conf
  allow_nxc               = local.vxlan.ndfc_fabric_msite_ext_net.allow_nxc
  bgp_as                  = local.vxlan.ndfc_fabric_msite_ext_net.bgp_as
  bootstrap_conf          = local.vxlan.ndfc_fabric_msite_ext_net.bootstrap_conf
  bootstrap_conf_xe       = local.vxlan.ndfc_fabric_msite_ext_net.bootstrap_conf_xe
  bootstrap_enable        = local.vxlan.ndfc_fabric_msite_ext_net.bootstrap_enable
  bootstrap_multisubnet   = local.vxlan.ndfc_fabric_msite_ext_net.bootstrap_multisubnet
  cdp_enable              = local.vxlan.ndfc_fabric_msite_ext_net.cdp_enable
  dci_subnet_range        = local.vxlan.ndfc_fabric_msite_ext_net.dci_subnet_range
  dci_subnet_target_mask  = local.vxlan.ndfc_fabric_msite_ext_net.dci_subnet_target_mask
  deploy                  = local.vxlan.ndfc_fabric_msite_ext_net.deploy
  deployment_freeze       = local.vxlan.ndfc_fabric_msite_ext_net.deployment_freeze
  deployment_status       = local.vxlan.ndfc_fabric_msite_ext_net.deployment_status
  dhcp_enable             = local.vxlan.ndfc_fabric_msite_ext_net.dhcp_enable
  dhcp_end                = local.vxlan.ndfc_fabric_msite_ext_net.dhcp_end
  dhcp_ipv6_enable        = local.vxlan.ndfc_fabric_msite_ext_net.dhcp_ipv6_enable
  dhcp_start              = local.vxlan.ndfc_fabric_msite_ext_net.dhcp_start
  domain_name             = local.vxlan.ndfc_fabric_msite_ext_net.domain_name
  enable_aaa              = local.vxlan.ndfc_fabric_msite_ext_net.enable_aaa
  enable_netflow          = local.vxlan.ndfc_fabric_msite_ext_net.enable_netflow
  enable_nxapi            = local.vxlan.ndfc_fabric_msite_ext_net.enable_nxapi
  enable_nxapi_http       = local.vxlan.ndfc_fabric_msite_ext_net.enable_nxapi_http
  enable_real_time_backup = local.vxlan.ndfc_fabric_msite_ext_net.enable_real_time_backup
  enable_rt_intf_stats    = local.vxlan.ndfc_fabric_msite_ext_net.enable_rt_intf_stats
  enable_scheduled_backup = local.vxlan.ndfc_fabric_msite_ext_net.enable_scheduled_backup
  ext_fabric_type         = local.vxlan.ndfc_fabric_msite_ext_net.ext_fabric_type
  fabric_freeform         = local.vxlan.ndfc_fabric_msite_ext_net.fabric_freeform
  fabric_name             = local.vxlan.ndfc_fabric_msite_ext_net.fabric_name
  feature_ptp             = local.vxlan.ndfc_fabric_msite_ext_net.feature_ptp
  ff                      = local.vxlan.ndfc_fabric_msite_ext_net.ff
  inband_enable           = local.vxlan.ndfc_fabric_msite_ext_net.inband_enable
  inband_mgmt             = local.vxlan.ndfc_fabric_msite_ext_net.inband_mgmt
  intf_stat_load_interval = local.vxlan.ndfc_fabric_msite_ext_net.intf_stat_load_interval
  is_read_only            = local.vxlan.ndfc_fabric_msite_ext_net.is_read_only
  loopback0_ip_range      = local.vxlan.ndfc_fabric_msite_ext_net.loopback0_ip_range
  mgmt_gw                 = local.vxlan.ndfc_fabric_msite_ext_net.mgmt_gw
  mgmt_prefix             = local.vxlan.ndfc_fabric_msite_ext_net.mgmt_prefix
  mgmt_v6prefix           = local.vxlan.ndfc_fabric_msite_ext_net.mgmt_v6prefix
  mpls_handoff            = local.vxlan.ndfc_fabric_msite_ext_net.mpls_handoff
  mpls_lb_id              = local.vxlan.ndfc_fabric_msite_ext_net.mpls_lb_id
  mpls_loopback_ip_range  = local.vxlan.ndfc_fabric_msite_ext_net.mpls_loopback_ip_range
  netflow_exporter_list   = local.vxlan.ndfc_fabric_msite_ext_net.netflow_exporter_list
  netflow_monitor_list    = local.vxlan.ndfc_fabric_msite_ext_net.netflow_monitor_list
  netflow_record_list     = local.vxlan.ndfc_fabric_msite_ext_net.netflow_record_list
  netflow_sampler_list    = local.vxlan.ndfc_fabric_msite_ext_net.netflow_sampler_list
  nxapi_http_port         = local.vxlan.ndfc_fabric_msite_ext_net.nxapi_http_port
  nxapi_https_port        = local.vxlan.ndfc_fabric_msite_ext_net.nxapi_https_port
  nxc_dest_vrf            = local.vxlan.ndfc_fabric_msite_ext_net.nxc_dest_vrf
  nxc_proxy_port          = local.vxlan.ndfc_fabric_msite_ext_net.nxc_proxy_port
  nxc_proxy_server        = local.vxlan.ndfc_fabric_msite_ext_net.nxc_proxy_server
  nxc_src_intf            = local.vxlan.ndfc_fabric_msite_ext_net.nxc_src_intf
  overwrite_global_nxc    = local.vxlan.ndfc_fabric_msite_ext_net.overwrite_global_nxc
  pm_enable               = local.vxlan.ndfc_fabric_msite_ext_net.pm_enable
  pnp_enable              = local.vxlan.ndfc_fabric_msite_ext_net.pnp_enable
  power_redundancy_mode   = local.vxlan.ndfc_fabric_msite_ext_net.power_redundancy_mode
  ptp_domain_id           = local.vxlan.ndfc_fabric_msite_ext_net.ptp_domain_id
  ptp_lb_id               = local.vxlan.ndfc_fabric_msite_ext_net.ptp_lb_id
  scheduled_time          = local.vxlan.ndfc_fabric_msite_ext_net.scheduled_time
  snmp_server_host_trap   = local.vxlan.ndfc_fabric_msite_ext_net.snmp_server_host_trap
  subinterface_range      = local.vxlan.ndfc_fabric_msite_ext_net.subinterface_range
  depends_on              = [ndfc_fabric_vxlan_msd.this]
}

# 007 1. Global, fabric and features
resource "ndfc_inventory_devices" "this" {
  auth_protocol                             = local.vxlan.ndfc_inventory_devices.auth_protocol
  deploy                                    = local.vxlan.ndfc_inventory_devices.deploy
  devices                                   = local.vxlan.ndfc_inventory_devices.devices
  fabric_name                               = local.vxlan.ndfc_inventory_devices.fabric_name
  max_hops                                  = local.vxlan.ndfc_inventory_devices.max_hops
  password                                  = var.ndfc_switch_password
  preserve_config                           = local.vxlan.ndfc_inventory_devices.preserve_config
  retries                                   = local.vxlan.ndfc_inventory_devices.retries
  retry_wait_timeout                        = local.vxlan.ndfc_inventory_devices.retry_wait_timeout
  save                                      = local.vxlan.ndfc_inventory_devices.save
  seed_ip                                   = local.vxlan.ndfc_inventory_devices.seed_ip
  set_as_individual_device_write_credential = local.vxlan.ndfc_inventory_devices.set_as_individual_device_write_credential
  username                                  = var.ndfc_switch_username
  depends_on                                = [ndfc_fabric_msite_ext_net.this]
}

# 008 2. Underlay
resource "nxos_loopback_interface" "this" {
  deletion_policy     = local.vxlan.nxos_loopback_interface.deletion_policy
  device              = local.vxlan.nxos_loopback_interface.device
  loopback_interfaces = local.vxlan.nxos_loopback_interface.loopback_interfaces
  depends_on          = [nxos_platform.this]
}

# 009 2. Underlay
resource "nxos_ipv4" "this" {
  access_list_match_local                 = local.vxlan.nxos_ipv4.access_list_match_local
  admin_state                             = local.vxlan.nxos_ipv4.admin_state
  control                                 = local.vxlan.nxos_ipv4.control
  deletion_policy                         = local.vxlan.nxos_ipv4.deletion_policy
  device                                  = local.vxlan.nxos_ipv4.device
  hardware_ecmp_hash_offset_concatenation = local.vxlan.nxos_ipv4.hardware_ecmp_hash_offset_concatenation
  hardware_ecmp_hash_offset_value         = local.vxlan.nxos_ipv4.hardware_ecmp_hash_offset_value
  hardware_ecmp_hash_polynomial           = local.vxlan.nxos_ipv4.hardware_ecmp_hash_polynomial
  instance_admin_state                    = local.vxlan.nxos_ipv4.instance_admin_state
  load_sharing_concatenation              = local.vxlan.nxos_ipv4.load_sharing_concatenation
  load_sharing_ecmp                       = local.vxlan.nxos_ipv4.load_sharing_ecmp
  load_sharing_exclude_l3_protocol        = local.vxlan.nxos_ipv4.load_sharing_exclude_l3_protocol
  load_sharing_gre_outer_hash             = local.vxlan.nxos_ipv4.load_sharing_gre_outer_hash
  load_sharing_keyshift                   = local.vxlan.nxos_ipv4.load_sharing_keyshift
  load_sharing_mode                       = local.vxlan.nxos_ipv4.load_sharing_mode
  load_sharing_rotate                     = local.vxlan.nxos_ipv4.load_sharing_rotate
  load_sharing_second_hierarchy_keyshift  = local.vxlan.nxos_ipv4.load_sharing_second_hierarchy_keyshift
  load_sharing_udf_length                 = local.vxlan.nxos_ipv4.load_sharing_udf_length
  load_sharing_udf_offset                 = local.vxlan.nxos_ipv4.load_sharing_udf_offset
  load_sharing_universal_id               = local.vxlan.nxos_ipv4.load_sharing_universal_id
  logging_level                           = local.vxlan.nxos_ipv4.logging_level
  redirect_syslog                         = local.vxlan.nxos_ipv4.redirect_syslog
  redirect_syslog_interval                = local.vxlan.nxos_ipv4.redirect_syslog_interval
  source_route                            = local.vxlan.nxos_ipv4.source_route
  vrfs                                    = local.vxlan.nxos_ipv4.vrfs
  depends_on                              = [nxos_loopback_interface.this]
}

# 010 2. Underlay
resource "nxos_ospf" "this" {
  admin_state     = local.vxlan.nxos_ospf.admin_state
  deletion_policy = local.vxlan.nxos_ospf.deletion_policy
  device          = local.vxlan.nxos_ospf.device
  instances       = local.vxlan.nxos_ospf.instances
  depends_on      = [nxos_ipv4.this]
}

# 011 2. Underlay
resource "nxos_isis" "this" {
  admin_state     = local.vxlan.nxos_isis.admin_state
  deletion_policy = local.vxlan.nxos_isis.deletion_policy
  device          = local.vxlan.nxos_isis.device
  instances       = local.vxlan.nxos_isis.instances
  interfaces      = local.vxlan.nxos_isis.interfaces
  depends_on      = [nxos_ospf.this]
}

# 012 2. Underlay
resource "nxos_bfd" "this" {
  admin_state                    = local.vxlan.nxos_bfd.admin_state
  deletion_policy                = local.vxlan.nxos_bfd.deletion_policy
  detect_multiplier              = local.vxlan.nxos_bfd.detect_multiplier
  device                         = local.vxlan.nxos_bfd.device
  echo_interface                 = local.vxlan.nxos_bfd.echo_interface
  echo_receive_interval          = local.vxlan.nxos_bfd.echo_receive_interval
  hardware_offload               = local.vxlan.nxos_bfd.hardware_offload
  instance_admin_state           = local.vxlan.nxos_bfd.instance_admin_state
  instance_control               = local.vxlan.nxos_bfd.instance_control
  interfaces                     = local.vxlan.nxos_bfd.interfaces
  min_receive_interval           = local.vxlan.nxos_bfd.min_receive_interval
  min_transmit_interval          = local.vxlan.nxos_bfd.min_transmit_interval
  multihop_detect_multiplier     = local.vxlan.nxos_bfd.multihop_detect_multiplier
  multihop_min_receive_interval  = local.vxlan.nxos_bfd.multihop_min_receive_interval
  multihop_min_transmit_interval = local.vxlan.nxos_bfd.multihop_min_transmit_interval
  slow_interval                  = local.vxlan.nxos_bfd.slow_interval
  startup_interval               = local.vxlan.nxos_bfd.startup_interval
  depends_on                     = [nxos_isis.this]
}

# 013 2. Underlay
resource "nxos_pim" "this" {
  admin_state                    = local.vxlan.nxos_pim.admin_state
  control                        = local.vxlan.nxos_pim.control
  deletion_policy                = local.vxlan.nxos_pim.deletion_policy
  device                         = local.vxlan.nxos_pim.device
  evpn_border_leaf               = local.vxlan.nxos_pim.evpn_border_leaf
  extra_net                      = local.vxlan.nxos_pim.extra_net
  instance_admin_state           = local.vxlan.nxos_pim.instance_admin_state
  isolate                        = local.vxlan.nxos_pim.isolate
  join_prune_delay               = local.vxlan.nxos_pim.join_prune_delay
  log_level                      = local.vxlan.nxos_pim.log_level
  null_register_delay            = local.vxlan.nxos_pim.null_register_delay
  null_register_number_of_routes = local.vxlan.nxos_pim.null_register_number_of_routes
  register_stop                  = local.vxlan.nxos_pim.register_stop
  syslog_level                   = local.vxlan.nxos_pim.syslog_level
  vrfs                           = local.vxlan.nxos_pim.vrfs
  depends_on                     = [nxos_bfd.this]
}

# 014 2. Underlay
resource "nxos_msdp" "this" {
  admin_state          = local.vxlan.nxos_msdp.admin_state
  deletion_policy      = local.vxlan.nxos_msdp.deletion_policy
  device               = local.vxlan.nxos_msdp.device
  instance_admin_state = local.vxlan.nxos_msdp.instance_admin_state
  instance_control     = local.vxlan.nxos_msdp.instance_control
  vrfs                 = local.vxlan.nxos_msdp.vrfs
  depends_on           = [nxos_pim.this]
}

# 015 2. Underlay
resource "ndfc_links" "this" {
  destination_device    = local.vxlan.ndfc_links.destination_device
  destination_fabric    = local.vxlan.ndfc_links.destination_fabric
  destination_interface = local.vxlan.ndfc_links.destination_interface
  link_parameters       = local.vxlan.ndfc_links.link_parameters
  source_device         = local.vxlan.ndfc_links.source_device
  source_fabric         = local.vxlan.ndfc_links.source_fabric
  source_interface      = local.vxlan.ndfc_links.source_interface
  template_name         = local.vxlan.ndfc_links.template_name
  depends_on            = [ndfc_inventory_devices.this]
}

# 016 3. VTEP and overlay
resource "nxos_nvo" "this" {
  advertise_evpn_multicast_state                       = local.vxlan.nxos_nvo.advertise_evpn_multicast_state
  deletion_policy                                      = local.vxlan.nxos_nvo.deletion_policy
  device                                               = local.vxlan.nxos_nvo.device
  evpn_multihoming_delay_restore_time                  = local.vxlan.nxos_nvo.evpn_multihoming_delay_restore_time
  evpn_multihoming_df_election_mode                    = local.vxlan.nxos_nvo.evpn_multihoming_df_election_mode
  evpn_multihoming_df_election_time                    = local.vxlan.nxos_nvo.evpn_multihoming_df_election_time
  evpn_multihoming_ead_evi_route                       = local.vxlan.nxos_nvo.evpn_multihoming_ead_evi_route
  evpn_multihoming_frr_anycast_source_ip               = local.vxlan.nxos_nvo.evpn_multihoming_frr_anycast_source_ip
  evpn_multihoming_state                               = local.vxlan.nxos_nvo.evpn_multihoming_state
  evpn_multihoming_system_mac                          = local.vxlan.nxos_nvo.evpn_multihoming_system_mac
  evpn_multisite_border_gateway_dci_advertise_pip      = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_dci_advertise_pip
  evpn_multisite_border_gateway_delay_restore_time     = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_delay_restore_time
  evpn_multisite_border_gateway_df_election_time       = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_df_election_time
  evpn_multisite_border_gateway_fabric_advertise_pip   = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_fabric_advertise_pip
  evpn_multisite_border_gateway_site_id                = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_site_id
  evpn_multisite_border_gateway_split_horizon_per_site = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_split_horizon_per_site
  evpn_multisite_border_gateway_state                  = local.vxlan.nxos_nvo.evpn_multisite_border_gateway_state
  evpn_storm_controls                                  = local.vxlan.nxos_nvo.evpn_storm_controls
  nve_interfaces                                       = local.vxlan.nxos_nvo.nve_interfaces
  vxlan_udp_port                                       = local.vxlan.nxos_nvo.vxlan_udp_port
  vxlan_udp_source_port_mode                           = local.vxlan.nxos_nvo.vxlan_udp_source_port_mode
  depends_on                                           = [nxos_msdp.this]
}

# 017 3. VTEP and overlay
resource "nxos_bgp" "this" {
  admin_state                              = local.vxlan.nxos_bgp.admin_state
  asn                                      = local.vxlan.nxos_bgp.asn
  control                                  = local.vxlan.nxos_bgp.control
  deletion_policy                          = local.vxlan.nxos_bgp.deletion_policy
  device                                   = local.vxlan.nxos_bgp.device
  disable_policy_batching                  = local.vxlan.nxos_bgp.disable_policy_batching
  disable_policy_batching_ipv4_prefix_list = local.vxlan.nxos_bgp.disable_policy_batching_ipv4_prefix_list
  disable_policy_batching_ipv6_prefix_list = local.vxlan.nxos_bgp.disable_policy_batching_ipv6_prefix_list
  disable_policy_batching_nexthop          = local.vxlan.nxos_bgp.disable_policy_batching_nexthop
  enhanced_error_handling                  = local.vxlan.nxos_bgp.enhanced_error_handling
  fabric_soo                               = local.vxlan.nxos_bgp.fabric_soo
  flush_routes                             = local.vxlan.nxos_bgp.flush_routes
  instance_admin_state                     = local.vxlan.nxos_bgp.instance_admin_state
  isolate                                  = local.vxlan.nxos_bgp.isolate
  isolate_route_map                        = local.vxlan.nxos_bgp.isolate_route_map
  med_dampening_interval                   = local.vxlan.nxos_bgp.med_dampening_interval
  mvpn_vri_id                              = local.vxlan.nxos_bgp.mvpn_vri_id
  nexthop_suppress_default_resolution      = local.vxlan.nxos_bgp.nexthop_suppress_default_resolution
  rd_dual                                  = local.vxlan.nxos_bgp.rd_dual
  rd_dual_id                               = local.vxlan.nxos_bgp.rd_dual_id
  vrfs                                     = local.vxlan.nxos_bgp.vrfs
  depends_on                               = [nxos_nvo.this]
}

# 018 3. VTEP and overlay
resource "nxos_evpn" "this" {
  admin_state     = local.vxlan.nxos_evpn.admin_state
  deletion_policy = local.vxlan.nxos_evpn.deletion_policy
  device          = local.vxlan.nxos_evpn.device
  vnis            = local.vxlan.nxos_evpn.vnis
  depends_on      = [nxos_bgp.this]
}

# 019 4. VRFs and L3VNI
resource "nxos_route_policy" "this" {
  admin_state              = local.vxlan.nxos_route_policy.admin_state
  as_path_access_lists     = local.vxlan.nxos_route_policy.as_path_access_lists
  community_lists          = local.vxlan.nxos_route_policy.community_lists
  deletion_policy          = local.vxlan.nxos_route_policy.deletion_policy
  device                   = local.vxlan.nxos_route_policy.device
  extended_community_lists = local.vxlan.nxos_route_policy.extended_community_lists
  ipv4_policy_interfaces   = local.vxlan.nxos_route_policy.ipv4_policy_interfaces
  ipv4_prefix_lists        = local.vxlan.nxos_route_policy.ipv4_prefix_lists
  ipv6_policy_interfaces   = local.vxlan.nxos_route_policy.ipv6_policy_interfaces
  ipv6_prefix_lists        = local.vxlan.nxos_route_policy.ipv6_prefix_lists
  large_community_lists    = local.vxlan.nxos_route_policy.large_community_lists
  route_maps               = local.vxlan.nxos_route_policy.route_maps
  depends_on               = [nxos_evpn.this]
}

# 020 4. VRFs and L3VNI
resource "nxos_vrf" "this" {
  deletion_policy = local.vxlan.nxos_vrf.deletion_policy
  device          = local.vxlan.nxos_vrf.device
  vrfs            = local.vxlan.nxos_vrf.vrfs
  depends_on      = [nxos_route_policy.this]
}

# 021 4. VRFs and L3VNI
resource "ndfc_vrfs" "this" {
  deploy_all_attachments = local.vxlan.ndfc_vrfs.deploy_all_attachments
  fabric_name            = local.vxlan.ndfc_vrfs.fabric_name
  vrfs                   = local.vxlan.ndfc_vrfs.vrfs
  depends_on             = [ndfc_links.this]
}

# 022 5. Networks and L2VNI
resource "nxos_bridge_domain" "this" {
  bridge_domains      = local.vxlan.nxos_bridge_domain.bridge_domains
  deletion_policy     = local.vxlan.nxos_bridge_domain.deletion_policy
  device              = local.vxlan.nxos_bridge_domain.device
  svi_autostate       = local.vxlan.nxos_bridge_domain.svi_autostate
  vlan_configurations = local.vxlan.nxos_bridge_domain.vlan_configurations
  depends_on          = [nxos_vrf.this]
}

# 023 5. Networks and L2VNI
resource "nxos_hmm" "this" {
  admin_state                      = local.vxlan.nxos_hmm.admin_state
  administrative_distance          = local.vxlan.nxos_hmm.administrative_distance
  anycast_mac                      = local.vxlan.nxos_hmm.anycast_mac
  control                          = local.vxlan.nxos_hmm.control
  deletion_policy                  = local.vxlan.nxos_hmm.deletion_policy
  device                           = local.vxlan.nxos_hmm.device
  duplicate_host_detection_moves   = local.vxlan.nxos_hmm.duplicate_host_detection_moves
  duplicate_host_detection_seconds = local.vxlan.nxos_hmm.duplicate_host_detection_seconds
  duplicate_host_recovery_count    = local.vxlan.nxos_hmm.duplicate_host_recovery_count
  duplicate_host_recovery_timeout  = local.vxlan.nxos_hmm.duplicate_host_recovery_timeout
  evpn_admin_state                 = local.vxlan.nxos_hmm.evpn_admin_state
  evpn_control                     = local.vxlan.nxos_hmm.evpn_control
  instance_admin_state             = local.vxlan.nxos_hmm.instance_admin_state
  interfaces                       = local.vxlan.nxos_hmm.interfaces
  limit_vlan_mac                   = local.vxlan.nxos_hmm.limit_vlan_mac
  selective_host_probe             = local.vxlan.nxos_hmm.selective_host_probe
  depends_on                       = [nxos_bridge_domain.this]
}

# 024 5. Networks and L2VNI
resource "nxos_svi_interface" "this" {
  deletion_policy = local.vxlan.nxos_svi_interface.deletion_policy
  device          = local.vxlan.nxos_svi_interface.device
  svi_interfaces  = local.vxlan.nxos_svi_interface.svi_interfaces
  depends_on      = [nxos_hmm.this]
}

# 025 5. Networks and L2VNI
resource "nxos_igmp_snooping" "this" {
  admin_state                                = local.vxlan.nxos_igmp_snooping.admin_state
  deletion_policy                            = local.vxlan.nxos_igmp_snooping.deletion_policy
  device                                     = local.vxlan.nxos_igmp_snooping.device
  domain_control                             = local.vxlan.nxos_igmp_snooping.domain_control
  domain_name                                = local.vxlan.nxos_igmp_snooping.domain_name
  global_vlan_disable_nve_static_router_port = local.vxlan.nxos_igmp_snooping.global_vlan_disable_nve_static_router_port
  global_vlan_vxlan                          = local.vxlan.nxos_igmp_snooping.global_vlan_vxlan
  global_vlan_vxlan_umc_drop_vlan            = local.vxlan.nxos_igmp_snooping.global_vlan_vxlan_umc_drop_vlan
  instance_admin_state                       = local.vxlan.nxos_igmp_snooping.instance_admin_state
  instance_control                           = local.vxlan.nxos_igmp_snooping.instance_control
  vlans                                      = local.vxlan.nxos_igmp_snooping.vlans
  depends_on                                 = [nxos_svi_interface.this]
}

# 026 5. Networks and L2VNI
resource "nxos_dhcp" "this" {
  admin_state                                 = local.vxlan.nxos_dhcp.admin_state
  dai_interfaces                              = local.vxlan.nxos_dhcp.dai_interfaces
  dai_log_buffer_entries                      = local.vxlan.nxos_dhcp.dai_log_buffer_entries
  dai_validate_destination                    = local.vxlan.nxos_dhcp.dai_validate_destination
  dai_validate_ip                             = local.vxlan.nxos_dhcp.dai_validate_ip
  dai_validate_source                         = local.vxlan.nxos_dhcp.dai_validate_source
  dai_vlans                                   = local.vxlan.nxos_dhcp.dai_vlans
  deletion_policy                             = local.vxlan.nxos_dhcp.deletion_policy
  device                                      = local.vxlan.nxos_dhcp.device
  ip_source_bindings                          = local.vxlan.nxos_dhcp.ip_source_bindings
  ip_source_guard_excluded_vlans              = local.vxlan.nxos_dhcp.ip_source_guard_excluded_vlans
  ip_source_guard_interfaces                  = local.vxlan.nxos_dhcp.ip_source_guard_interfaces
  ipv6_relay_information_option_vpn           = local.vxlan.nxos_dhcp.ipv6_relay_information_option_vpn
  ipv6_relay_option79                         = local.vxlan.nxos_dhcp.ipv6_relay_option79
  ipv6_relay_option_type_cisco                = local.vxlan.nxos_dhcp.ipv6_relay_option_type_cisco
  ipv6_source_interface                       = local.vxlan.nxos_dhcp.ipv6_source_interface
  ipv6_source_interface_admin_state           = local.vxlan.nxos_dhcp.ipv6_source_interface_admin_state
  packet_strict_validation                    = local.vxlan.nxos_dhcp.packet_strict_validation
  relay_dai                                   = local.vxlan.nxos_dhcp.relay_dai
  relay_information_option                    = local.vxlan.nxos_dhcp.relay_information_option
  relay_information_option_server_id_override = local.vxlan.nxos_dhcp.relay_information_option_server_id_override
  relay_information_option_trust              = local.vxlan.nxos_dhcp.relay_information_option_trust
  relay_information_option_vpn                = local.vxlan.nxos_dhcp.relay_information_option_vpn
  relay_information_trust_all                 = local.vxlan.nxos_dhcp.relay_information_trust_all
  relay_interfaces                            = local.vxlan.nxos_dhcp.relay_interfaces
  relay_sub_option_circuit_id_customized      = local.vxlan.nxos_dhcp.relay_sub_option_circuit_id_customized
  relay_sub_option_circuit_id_format_string   = local.vxlan.nxos_dhcp.relay_sub_option_circuit_id_format_string
  relay_sub_option_format_non_tlv             = local.vxlan.nxos_dhcp.relay_sub_option_format_non_tlv
  relay_sub_option_type_cisco                 = local.vxlan.nxos_dhcp.relay_sub_option_type_cisco
  relay_v4_over_v6                            = local.vxlan.nxos_dhcp.relay_v4_over_v6
  relay_v6_iapd_route_add                     = local.vxlan.nxos_dhcp.relay_v6_iapd_route_add
  smart_relay_global                          = local.vxlan.nxos_dhcp.smart_relay_global
  snoop_sub_option_circuit_id_format_string   = local.vxlan.nxos_dhcp.snoop_sub_option_circuit_id_format_string
  snooping                                    = local.vxlan.nxos_dhcp.snooping
  snooping_information_option                 = local.vxlan.nxos_dhcp.snooping_information_option
  snooping_interfaces                         = local.vxlan.nxos_dhcp.snooping_interfaces
  snooping_sub_option_format_non_tlv          = local.vxlan.nxos_dhcp.snooping_sub_option_format_non_tlv
  snooping_verify_mac_address                 = local.vxlan.nxos_dhcp.snooping_verify_mac_address
  snooping_vlans                              = local.vxlan.nxos_dhcp.snooping_vlans
  source_interface                            = local.vxlan.nxos_dhcp.source_interface
  v4_relay                                    = local.vxlan.nxos_dhcp.v4_relay
  v6_relay                                    = local.vxlan.nxos_dhcp.v6_relay
  v6_smart_relay_global                       = local.vxlan.nxos_dhcp.v6_smart_relay_global
  depends_on                                  = [nxos_igmp_snooping.this]
}

# 027 5. Networks and L2VNI
resource "ndfc_networks" "this" {
  deploy_all_attachments = local.vxlan.ndfc_networks.deploy_all_attachments
  fabric_name            = local.vxlan.ndfc_networks.fabric_name
  networks               = local.vxlan.ndfc_networks.networks
  depends_on             = [ndfc_vrfs.this]
}

# 028 6. Interfaces and access
resource "nxos_physical_interface" "this" {
  deletion_policy     = local.vxlan.nxos_physical_interface.deletion_policy
  device              = local.vxlan.nxos_physical_interface.device
  physical_interfaces = local.vxlan.nxos_physical_interface.physical_interfaces
  depends_on          = [nxos_dhcp.this]
}

# 029 6. Interfaces and access
resource "nxos_vpc" "this" {
  admin_state                                  = local.vxlan.nxos_vpc.admin_state
  auto_recovery                                = local.vxlan.nxos_vpc.auto_recovery
  auto_recovery_interval                       = local.vxlan.nxos_vpc.auto_recovery_interval
  control                                      = local.vxlan.nxos_vpc.control
  delay_peer_link_bringup                      = local.vxlan.nxos_vpc.delay_peer_link_bringup
  delay_restore_orphan_port                    = local.vxlan.nxos_vpc.delay_restore_orphan_port
  delay_restore_svi                            = local.vxlan.nxos_vpc.delay_restore_svi
  delay_restore_vpc                            = local.vxlan.nxos_vpc.delay_restore_vpc
  deletion_policy                              = local.vxlan.nxos_vpc.deletion_policy
  device                                       = local.vxlan.nxos_vpc.device
  domain_admin_state                           = local.vxlan.nxos_vpc.domain_admin_state
  domain_id                                    = local.vxlan.nxos_vpc.domain_id
  dscp                                         = local.vxlan.nxos_vpc.dscp
  exclude_svi                                  = local.vxlan.nxos_vpc.exclude_svi
  fast_convergence                             = local.vxlan.nxos_vpc.fast_convergence
  graceful_consistency_check                   = local.vxlan.nxos_vpc.graceful_consistency_check
  instance_admin_state                         = local.vxlan.nxos_vpc.instance_admin_state
  interfaces                                   = local.vxlan.nxos_vpc.interfaces
  keepalive_destination_ip                     = local.vxlan.nxos_vpc.keepalive_destination_ip
  keepalive_flush_timeout                      = local.vxlan.nxos_vpc.keepalive_flush_timeout
  keepalive_interval                           = local.vxlan.nxos_vpc.keepalive_interval
  keepalive_precedence_type                    = local.vxlan.nxos_vpc.keepalive_precedence_type
  keepalive_precedence_value                   = local.vxlan.nxos_vpc.keepalive_precedence_value
  keepalive_source_ip                          = local.vxlan.nxos_vpc.keepalive_source_ip
  keepalive_timeout                            = local.vxlan.nxos_vpc.keepalive_timeout
  keepalive_type_of_service_byte               = local.vxlan.nxos_vpc.keepalive_type_of_service_byte
  keepalive_type_of_service_configuration_type = local.vxlan.nxos_vpc.keepalive_type_of_service_configuration_type
  keepalive_type_of_service_type               = local.vxlan.nxos_vpc.keepalive_type_of_service_type
  keepalive_type_of_service_value              = local.vxlan.nxos_vpc.keepalive_type_of_service_value
  keepalive_udp_port                           = local.vxlan.nxos_vpc.keepalive_udp_port
  keepalive_vrf                                = local.vxlan.nxos_vpc.keepalive_vrf
  l3_peer_router                               = local.vxlan.nxos_vpc.l3_peer_router
  l3_peer_router_syslog                        = local.vxlan.nxos_vpc.l3_peer_router_syslog
  l3_peer_router_syslog_interval               = local.vxlan.nxos_vpc.l3_peer_router_syslog_interval
  mac_bpdu_source_version_2                    = local.vxlan.nxos_vpc.mac_bpdu_source_version_2
  orphan_ports                                 = local.vxlan.nxos_vpc.orphan_ports
  peer_gateway                                 = local.vxlan.nxos_vpc.peer_gateway
  peer_gateway_exclude_vlan                    = local.vxlan.nxos_vpc.peer_gateway_exclude_vlan
  peer_ip                                      = local.vxlan.nxos_vpc.peer_ip
  peer_switch                                  = local.vxlan.nxos_vpc.peer_switch
  peerlink_admin_state                         = local.vxlan.nxos_vpc.peerlink_admin_state
  peerlink_description                         = local.vxlan.nxos_vpc.peerlink_description
  peerlink_interface_id                        = local.vxlan.nxos_vpc.peerlink_interface_id
  role_priority                                = local.vxlan.nxos_vpc.role_priority
  sys_mac                                      = local.vxlan.nxos_vpc.sys_mac
  system_priority                              = local.vxlan.nxos_vpc.system_priority
  track                                        = local.vxlan.nxos_vpc.track
  virtual_ip                                   = local.vxlan.nxos_vpc.virtual_ip
  depends_on                                   = [nxos_physical_interface.this]
}

# 030 6. Interfaces and access
resource "nxos_port_channel_interface" "this" {
  deletion_policy         = local.vxlan.nxos_port_channel_interface.deletion_policy
  device                  = local.vxlan.nxos_port_channel_interface.device
  port_channel_interfaces = local.vxlan.nxos_port_channel_interface.port_channel_interfaces
  depends_on              = [nxos_vpc.this]
}

# 031 6. Interfaces and access
resource "nxos_subinterface" "this" {
  deletion_policy = local.vxlan.nxos_subinterface.deletion_policy
  device          = local.vxlan.nxos_subinterface.device
  subinterfaces   = local.vxlan.nxos_subinterface.subinterfaces
  depends_on      = [nxos_port_channel_interface.this]
}

# 032 6. Interfaces and access
resource "nxos_spanning_tree" "this" {
  admin_state              = local.vxlan.nxos_spanning_tree.admin_state
  bridge_assurance         = local.vxlan.nxos_spanning_tree.bridge_assurance
  control                  = local.vxlan.nxos_spanning_tree.control
  deletion_policy          = local.vxlan.nxos_spanning_tree.deletion_policy
  device                   = local.vxlan.nxos_spanning_tree.device
  fcoe                     = local.vxlan.nxos_spanning_tree.fcoe
  instance_admin_state     = local.vxlan.nxos_spanning_tree.instance_admin_state
  interfaces               = local.vxlan.nxos_spanning_tree.interfaces
  l2_gateway_stp_domain_id = local.vxlan.nxos_spanning_tree.l2_gateway_stp_domain_id
  linecard_issu            = local.vxlan.nxos_spanning_tree.linecard_issu
  loopguard                = local.vxlan.nxos_spanning_tree.loopguard
  mode                     = local.vxlan.nxos_spanning_tree.mode
  mst_forward_time         = local.vxlan.nxos_spanning_tree.mst_forward_time
  mst_hello_time           = local.vxlan.nxos_spanning_tree.mst_hello_time
  mst_instances            = local.vxlan.nxos_spanning_tree.mst_instances
  mst_max_age              = local.vxlan.nxos_spanning_tree.mst_max_age
  mst_maximum_hops         = local.vxlan.nxos_spanning_tree.mst_maximum_hops
  mst_region_name          = local.vxlan.nxos_spanning_tree.mst_region_name
  mst_revision             = local.vxlan.nxos_spanning_tree.mst_revision
  mst_simulate_pvst        = local.vxlan.nxos_spanning_tree.mst_simulate_pvst
  pathcost_option          = local.vxlan.nxos_spanning_tree.pathcost_option
  vlans                    = local.vxlan.nxos_spanning_tree.vlans
  depends_on               = [nxos_subinterface.this]
}

# 033 6. Interfaces and access
resource "ndfc_vpc_pair" "this" {
  deploy               = local.vxlan.ndfc_vpc_pair.deploy
  serial_numbers       = local.vxlan.ndfc_vpc_pair.serial_numbers
  use_virtual_peerlink = local.vxlan.ndfc_vpc_pair.use_virtual_peerlink
  depends_on           = [ndfc_networks.this]
}

# 034 6. Interfaces and access
resource "ndfc_interface_ethernet" "this" {
  deploy        = local.vxlan.ndfc_interface_ethernet.deploy
  interfaces    = local.vxlan.ndfc_interface_ethernet.interfaces
  policy        = local.vxlan.ndfc_interface_ethernet.policy
  policy_type   = local.vxlan.ndfc_interface_ethernet.policy_type
  serial_number = local.vxlan.ndfc_interface_ethernet.serial_number
  depends_on    = [ndfc_vpc_pair.this]
}

# 035 6. Interfaces and access
resource "ndfc_interface_portchannel" "this" {
  deploy        = local.vxlan.ndfc_interface_portchannel.deploy
  interfaces    = local.vxlan.ndfc_interface_portchannel.interfaces
  policy        = local.vxlan.ndfc_interface_portchannel.policy
  serial_number = local.vxlan.ndfc_interface_portchannel.serial_number
  depends_on    = [ndfc_interface_ethernet.this]
}

# 036 6. Interfaces and access
resource "ndfc_interface_vpc" "this" {
  deploy        = local.vxlan.ndfc_interface_vpc.deploy
  interfaces    = local.vxlan.ndfc_interface_vpc.interfaces
  policy        = local.vxlan.ndfc_interface_vpc.policy
  serial_number = local.vxlan.ndfc_interface_vpc.serial_number
  depends_on    = [ndfc_interface_portchannel.this]
}

# 037 6. Interfaces and access
resource "ndfc_interface_loopback" "this" {
  deploy        = local.vxlan.ndfc_interface_loopback.deploy
  interfaces    = local.vxlan.ndfc_interface_loopback.interfaces
  policy        = local.vxlan.ndfc_interface_loopback.policy
  serial_number = local.vxlan.ndfc_interface_loopback.serial_number
  depends_on    = [ndfc_interface_vpc.this]
}

# 038 6. Interfaces and access
resource "ndfc_interface_vlan" "this" {
  deploy        = local.vxlan.ndfc_interface_vlan.deploy
  interfaces    = local.vxlan.ndfc_interface_vlan.interfaces
  policy        = local.vxlan.ndfc_interface_vlan.policy
  serial_number = local.vxlan.ndfc_interface_vlan.serial_number
  depends_on    = [ndfc_interface_loopback.this]
}

# 039 7. Day 2 and operations
resource "nxos_dme" "this" {
  children   = local.vxlan.nxos_dme.children
  class_name = local.vxlan.nxos_dme.class_name
  content    = local.vxlan.nxos_dme.content
  delete     = local.vxlan.nxos_dme.delete
  device     = local.vxlan.nxos_dme.device
  dn         = local.vxlan.nxos_dme.dn
  depends_on = [nxos_spanning_tree.this]
}

# 040 7. Day 2 and operations
resource "nxos_cli" "this" {
  cli        = local.vxlan.nxos_cli.cli
  device     = local.vxlan.nxos_cli.device
  depends_on = [nxos_dme.this]
}

# 041 7. Day 2 and operations
resource "nxos_save_config" "this" {
  device     = local.vxlan.nxos_save_config.device
  save       = local.vxlan.nxos_save_config.save
  depends_on = [nxos_cli.this]
}

# 042 7. Day 2 and operations
resource "ndfc_template" "this" {
  content_type        = local.vxlan.ndfc_template.content_type
  description         = local.vxlan.ndfc_template.description
  supported_platforms = local.vxlan.ndfc_template.supported_platforms
  tags                = local.vxlan.ndfc_template.tags
  template_content    = local.vxlan.ndfc_template.template_content
  template_name       = local.vxlan.ndfc_template.template_name
  template_sub_type   = local.vxlan.ndfc_template.template_sub_type
  template_type       = local.vxlan.ndfc_template.template_type
  depends_on          = [ndfc_interface_vlan.this]
}

# 043 7. Day 2 and operations
resource "ndfc_policy" "this" {
  deploy            = local.vxlan.ndfc_policy.deploy
  description       = local.vxlan.ndfc_policy.description
  entity_name       = local.vxlan.ndfc_policy.entity_name
  entity_type       = local.vxlan.ndfc_policy.entity_type
  is_policy_group   = local.vxlan.ndfc_policy.is_policy_group
  policy_parameters = local.vxlan.ndfc_policy.policy_parameters
  priority          = local.vxlan.ndfc_policy.priority
  serial_numbers    = local.vxlan.ndfc_policy.serial_numbers
  source            = local.vxlan.ndfc_policy.source
  template_name     = local.vxlan.ndfc_policy.template_name
  depends_on        = [ndfc_template.this]
}

# 044 7. Day 2 and operations
resource "ndfc_rest_api" "this" {
  delete_method     = local.vxlan.ndfc_rest_api.delete_method
  delete_parameters = local.vxlan.ndfc_rest_api.delete_parameters
  delete_payload    = local.vxlan.ndfc_rest_api.delete_payload
  delete_url        = local.vxlan.ndfc_rest_api.delete_url
  method            = local.vxlan.ndfc_rest_api.method
  payload           = local.vxlan.ndfc_rest_api.payload
  read_url          = local.vxlan.ndfc_rest_api.read_url
  stateful          = local.vxlan.ndfc_rest_api.stateful
  update_method     = local.vxlan.ndfc_rest_api.update_method
  update_payload    = local.vxlan.ndfc_rest_api.update_payload
  update_url        = local.vxlan.ndfc_rest_api.update_url
  url               = local.vxlan.ndfc_rest_api.url
  depends_on        = [ndfc_policy.this]
}

# 045 7. Day 2 and operations
resource "ndfc_configuration_deploy" "this" {
  always_execute = local.vxlan.ndfc_configuration_deploy.always_execute
  deploy         = local.vxlan.ndfc_configuration_deploy.deploy
  fabric_name    = local.vxlan.ndfc_configuration_deploy.fabric_name
  recalculate    = local.vxlan.ndfc_configuration_deploy.recalculate
  serial_numbers = local.vxlan.ndfc_configuration_deploy.serial_numbers
  depends_on     = [ndfc_rest_api.this]
}

# 046 8. Other
resource "ndfc_fabric_ipfm" "this" {
  aaa_remote_ip_enabled     = local.vxlan.ndfc_fabric_ipfm.aaa_remote_ip_enabled
  aaa_server_conf           = local.vxlan.ndfc_fabric_ipfm.aaa_server_conf
  active_migration          = local.vxlan.ndfc_fabric_ipfm.active_migration
  agent_intf                = local.vxlan.ndfc_fabric_ipfm.agent_intf
  asm_group_ranges          = local.vxlan.ndfc_fabric_ipfm.asm_group_ranges
  bootstrap_conf            = local.vxlan.ndfc_fabric_ipfm.bootstrap_conf
  bootstrap_enable          = local.vxlan.ndfc_fabric_ipfm.bootstrap_enable
  bootstrap_multisubnet     = local.vxlan.ndfc_fabric_ipfm.bootstrap_multisubnet
  brfield_debug_flag        = local.vxlan.ndfc_fabric_ipfm.brfield_debug_flag
  cdp_enable                = local.vxlan.ndfc_fabric_ipfm.cdp_enable
  deploy                    = local.vxlan.ndfc_fabric_ipfm.deploy
  deployment_freeze         = local.vxlan.ndfc_fabric_ipfm.deployment_freeze
  dhcp_enable               = local.vxlan.ndfc_fabric_ipfm.dhcp_enable
  dhcp_end                  = local.vxlan.ndfc_fabric_ipfm.dhcp_end
  dhcp_ipv6_enable          = local.vxlan.ndfc_fabric_ipfm.dhcp_ipv6_enable
  dhcp_start                = local.vxlan.ndfc_fabric_ipfm.dhcp_start
  dns_server_ip_list        = local.vxlan.ndfc_fabric_ipfm.dns_server_ip_list
  dns_server_vrf            = local.vxlan.ndfc_fabric_ipfm.dns_server_vrf
  enable_aaa                = local.vxlan.ndfc_fabric_ipfm.enable_aaa
  enable_agent              = local.vxlan.ndfc_fabric_ipfm.enable_agent
  enable_asm                = local.vxlan.ndfc_fabric_ipfm.enable_asm
  enable_nbm_passive        = local.vxlan.ndfc_fabric_ipfm.enable_nbm_passive
  enable_nxapi              = local.vxlan.ndfc_fabric_ipfm.enable_nxapi
  enable_nxapi_http         = local.vxlan.ndfc_fabric_ipfm.enable_nxapi_http
  enable_rt_intf_stats      = local.vxlan.ndfc_fabric_ipfm.enable_rt_intf_stats
  ext_fabric_type           = local.vxlan.ndfc_fabric_ipfm.ext_fabric_type
  extra_conf_intra_links    = local.vxlan.ndfc_fabric_ipfm.extra_conf_intra_links
  extra_conf_leaf           = local.vxlan.ndfc_fabric_ipfm.extra_conf_leaf
  extra_conf_spine          = local.vxlan.ndfc_fabric_ipfm.extra_conf_spine
  fabric_mtu                = local.vxlan.ndfc_fabric_ipfm.fabric_mtu
  fabric_name               = local.vxlan.ndfc_fabric_ipfm.fabric_name
  feature_ptp               = local.vxlan.ndfc_fabric_ipfm.feature_ptp
  ff                        = local.vxlan.ndfc_fabric_ipfm.ff
  grfield_debug_flag        = local.vxlan.ndfc_fabric_ipfm.grfield_debug_flag
  intf_stat_load_interval   = local.vxlan.ndfc_fabric_ipfm.intf_stat_load_interval
  isis_auth_enable          = local.vxlan.ndfc_fabric_ipfm.isis_auth_enable
  isis_auth_key             = local.vxlan.ndfc_fabric_ipfm.isis_auth_key
  isis_auth_keychain_key_id = local.vxlan.ndfc_fabric_ipfm.isis_auth_keychain_key_id
  isis_auth_keychain_name   = local.vxlan.ndfc_fabric_ipfm.isis_auth_keychain_name
  isis_level                = local.vxlan.ndfc_fabric_ipfm.isis_level
  isis_p2p_enable           = local.vxlan.ndfc_fabric_ipfm.isis_p2p_enable
  l2_host_intf_mtu          = local.vxlan.ndfc_fabric_ipfm.l2_host_intf_mtu
  link_state_routing        = local.vxlan.ndfc_fabric_ipfm.link_state_routing
  link_state_routing_tag    = local.vxlan.ndfc_fabric_ipfm.link_state_routing_tag
  loopback0_ip_range        = local.vxlan.ndfc_fabric_ipfm.loopback0_ip_range
  mgmt_gw                   = local.vxlan.ndfc_fabric_ipfm.mgmt_gw
  mgmt_prefix               = local.vxlan.ndfc_fabric_ipfm.mgmt_prefix
  ntp_server_ip_list        = local.vxlan.ndfc_fabric_ipfm.ntp_server_ip_list
  ntp_server_vrf            = local.vxlan.ndfc_fabric_ipfm.ntp_server_vrf
  nxapi_http_port           = local.vxlan.ndfc_fabric_ipfm.nxapi_http_port
  nxapi_https_port          = local.vxlan.ndfc_fabric_ipfm.nxapi_https_port
  nxapi_vrf                 = local.vxlan.ndfc_fabric_ipfm.nxapi_vrf
  ospf_area_id              = local.vxlan.ndfc_fabric_ipfm.ospf_area_id
  ospf_auth_enable          = local.vxlan.ndfc_fabric_ipfm.ospf_auth_enable
  ospf_auth_key             = local.vxlan.ndfc_fabric_ipfm.ospf_auth_key
  ospf_auth_key_id          = local.vxlan.ndfc_fabric_ipfm.ospf_auth_key_id
  pim_hello_auth_enable     = local.vxlan.ndfc_fabric_ipfm.pim_hello_auth_enable
  pim_hello_auth_key        = local.vxlan.ndfc_fabric_ipfm.pim_hello_auth_key
  pm_enable                 = local.vxlan.ndfc_fabric_ipfm.pm_enable
  power_redundancy_mode     = local.vxlan.ndfc_fabric_ipfm.power_redundancy_mode
  ptp_domain_id             = local.vxlan.ndfc_fabric_ipfm.ptp_domain_id
  ptp_lb_id                 = local.vxlan.ndfc_fabric_ipfm.ptp_lb_id
  ptp_profile               = local.vxlan.ndfc_fabric_ipfm.ptp_profile
  replication_mode          = local.vxlan.ndfc_fabric_ipfm.replication_mode
  routing_lb_id             = local.vxlan.ndfc_fabric_ipfm.routing_lb_id
  rp_ip_range               = local.vxlan.ndfc_fabric_ipfm.rp_ip_range
  rp_lb_id                  = local.vxlan.ndfc_fabric_ipfm.rp_lb_id
  snmp_server_host_trap     = local.vxlan.ndfc_fabric_ipfm.snmp_server_host_trap
  static_underlay_ip_alloc  = local.vxlan.ndfc_fabric_ipfm.static_underlay_ip_alloc
  subnet_range              = local.vxlan.ndfc_fabric_ipfm.subnet_range
  subnet_target_mask        = local.vxlan.ndfc_fabric_ipfm.subnet_target_mask
  syslog_server_ip_list     = local.vxlan.ndfc_fabric_ipfm.syslog_server_ip_list
  syslog_server_vrf         = local.vxlan.ndfc_fabric_ipfm.syslog_server_vrf
  syslog_sev                = local.vxlan.ndfc_fabric_ipfm.syslog_sev
  depends_on                = [ndfc_configuration_deploy.this]
}

# 047 8. Other
resource "ndfc_fabric_lan_classic" "this" {
  aaa_remote_ip_enabled   = local.vxlan.ndfc_fabric_lan_classic.aaa_remote_ip_enabled
  aaa_server_conf         = local.vxlan.ndfc_fabric_lan_classic.aaa_server_conf
  allow_nxc               = local.vxlan.ndfc_fabric_lan_classic.allow_nxc
  bootstrap_conf          = local.vxlan.ndfc_fabric_lan_classic.bootstrap_conf
  bootstrap_enable        = local.vxlan.ndfc_fabric_lan_classic.bootstrap_enable
  bootstrap_multisubnet   = local.vxlan.ndfc_fabric_lan_classic.bootstrap_multisubnet
  cdp_enable              = local.vxlan.ndfc_fabric_lan_classic.cdp_enable
  dci_subnet_range        = local.vxlan.ndfc_fabric_lan_classic.dci_subnet_range
  dci_subnet_target_mask  = local.vxlan.ndfc_fabric_lan_classic.dci_subnet_target_mask
  deploy                  = local.vxlan.ndfc_fabric_lan_classic.deploy
  deployment_freeze       = local.vxlan.ndfc_fabric_lan_classic.deployment_freeze
  dhcp_enable             = local.vxlan.ndfc_fabric_lan_classic.dhcp_enable
  dhcp_end                = local.vxlan.ndfc_fabric_lan_classic.dhcp_end
  dhcp_ipv6_enable        = local.vxlan.ndfc_fabric_lan_classic.dhcp_ipv6_enable
  dhcp_start              = local.vxlan.ndfc_fabric_lan_classic.dhcp_start
  enable_aaa              = local.vxlan.ndfc_fabric_lan_classic.enable_aaa
  enable_netflow          = local.vxlan.ndfc_fabric_lan_classic.enable_netflow
  enable_nxapi            = local.vxlan.ndfc_fabric_lan_classic.enable_nxapi
  enable_nxapi_http       = local.vxlan.ndfc_fabric_lan_classic.enable_nxapi_http
  enable_real_time_backup = local.vxlan.ndfc_fabric_lan_classic.enable_real_time_backup
  enable_rt_intf_stats    = local.vxlan.ndfc_fabric_lan_classic.enable_rt_intf_stats
  enable_scheduled_backup = local.vxlan.ndfc_fabric_lan_classic.enable_scheduled_backup
  ext_fabric_type         = local.vxlan.ndfc_fabric_lan_classic.ext_fabric_type
  fabric_freeform         = local.vxlan.ndfc_fabric_lan_classic.fabric_freeform
  fabric_name             = local.vxlan.ndfc_fabric_lan_classic.fabric_name
  feature_ptp             = local.vxlan.ndfc_fabric_lan_classic.feature_ptp
  ff                      = local.vxlan.ndfc_fabric_lan_classic.ff
  inband_enable           = local.vxlan.ndfc_fabric_lan_classic.inband_enable
  inband_mgmt             = local.vxlan.ndfc_fabric_lan_classic.inband_mgmt
  intf_stat_load_interval = local.vxlan.ndfc_fabric_lan_classic.intf_stat_load_interval
  is_read_only            = local.vxlan.ndfc_fabric_lan_classic.is_read_only
  loopback0_ip_range      = local.vxlan.ndfc_fabric_lan_classic.loopback0_ip_range
  mgmt_gw                 = local.vxlan.ndfc_fabric_lan_classic.mgmt_gw
  mgmt_prefix             = local.vxlan.ndfc_fabric_lan_classic.mgmt_prefix
  mpls_handoff            = local.vxlan.ndfc_fabric_lan_classic.mpls_handoff
  mpls_lb_id              = local.vxlan.ndfc_fabric_lan_classic.mpls_lb_id
  mpls_loopback_ip_range  = local.vxlan.ndfc_fabric_lan_classic.mpls_loopback_ip_range
  netflow_exporter_list   = local.vxlan.ndfc_fabric_lan_classic.netflow_exporter_list
  netflow_monitor_list    = local.vxlan.ndfc_fabric_lan_classic.netflow_monitor_list
  netflow_record_list     = local.vxlan.ndfc_fabric_lan_classic.netflow_record_list
  netflow_sampler_list    = local.vxlan.ndfc_fabric_lan_classic.netflow_sampler_list
  nxapi_http_port         = local.vxlan.ndfc_fabric_lan_classic.nxapi_http_port
  nxapi_https_port        = local.vxlan.ndfc_fabric_lan_classic.nxapi_https_port
  nxc_dest_vrf            = local.vxlan.ndfc_fabric_lan_classic.nxc_dest_vrf
  nxc_proxy_port          = local.vxlan.ndfc_fabric_lan_classic.nxc_proxy_port
  nxc_proxy_server        = local.vxlan.ndfc_fabric_lan_classic.nxc_proxy_server
  nxc_src_intf            = local.vxlan.ndfc_fabric_lan_classic.nxc_src_intf
  overwrite_global_nxc    = local.vxlan.ndfc_fabric_lan_classic.overwrite_global_nxc
  pm_enable               = local.vxlan.ndfc_fabric_lan_classic.pm_enable
  power_redundancy_mode   = local.vxlan.ndfc_fabric_lan_classic.power_redundancy_mode
  ptp_domain_id           = local.vxlan.ndfc_fabric_lan_classic.ptp_domain_id
  ptp_lb_id               = local.vxlan.ndfc_fabric_lan_classic.ptp_lb_id
  scheduled_time          = local.vxlan.ndfc_fabric_lan_classic.scheduled_time
  snmp_server_host_trap   = local.vxlan.ndfc_fabric_lan_classic.snmp_server_host_trap
  subinterface_range      = local.vxlan.ndfc_fabric_lan_classic.subinterface_range
  depends_on              = [ndfc_fabric_ipfm.this]
}
