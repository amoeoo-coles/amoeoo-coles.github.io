# 029 nxos_vpc — 6. Interfaces and access
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/vpc
# Reads ../models/nxos_vpc.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_vpc = yamldecode(file("${path.module}/../models/nxos_vpc.yml"))["nxos_vpc"]
}

resource "nxos_vpc" "this" {
  admin_state                                  = local.nxos_vpc.admin_state
  auto_recovery                                = local.nxos_vpc.auto_recovery
  auto_recovery_interval                       = local.nxos_vpc.auto_recovery_interval
  control                                      = local.nxos_vpc.control
  delay_peer_link_bringup                      = local.nxos_vpc.delay_peer_link_bringup
  delay_restore_orphan_port                    = local.nxos_vpc.delay_restore_orphan_port
  delay_restore_svi                            = local.nxos_vpc.delay_restore_svi
  delay_restore_vpc                            = local.nxos_vpc.delay_restore_vpc
  deletion_policy                              = local.nxos_vpc.deletion_policy
  device                                       = local.nxos_vpc.device
  domain_admin_state                           = local.nxos_vpc.domain_admin_state
  domain_id                                    = local.nxos_vpc.domain_id
  dscp                                         = local.nxos_vpc.dscp
  exclude_svi                                  = local.nxos_vpc.exclude_svi
  fast_convergence                             = local.nxos_vpc.fast_convergence
  graceful_consistency_check                   = local.nxos_vpc.graceful_consistency_check
  instance_admin_state                         = local.nxos_vpc.instance_admin_state
  interfaces                                   = local.nxos_vpc.interfaces
  keepalive_destination_ip                     = local.nxos_vpc.keepalive_destination_ip
  keepalive_flush_timeout                      = local.nxos_vpc.keepalive_flush_timeout
  keepalive_interval                           = local.nxos_vpc.keepalive_interval
  keepalive_precedence_type                    = local.nxos_vpc.keepalive_precedence_type
  keepalive_precedence_value                   = local.nxos_vpc.keepalive_precedence_value
  keepalive_source_ip                          = local.nxos_vpc.keepalive_source_ip
  keepalive_timeout                            = local.nxos_vpc.keepalive_timeout
  keepalive_type_of_service_byte               = local.nxos_vpc.keepalive_type_of_service_byte
  keepalive_type_of_service_configuration_type = local.nxos_vpc.keepalive_type_of_service_configuration_type
  keepalive_type_of_service_type               = local.nxos_vpc.keepalive_type_of_service_type
  keepalive_type_of_service_value              = local.nxos_vpc.keepalive_type_of_service_value
  keepalive_udp_port                           = local.nxos_vpc.keepalive_udp_port
  keepalive_vrf                                = local.nxos_vpc.keepalive_vrf
  l3_peer_router                               = local.nxos_vpc.l3_peer_router
  l3_peer_router_syslog                        = local.nxos_vpc.l3_peer_router_syslog
  l3_peer_router_syslog_interval               = local.nxos_vpc.l3_peer_router_syslog_interval
  mac_bpdu_source_version_2                    = local.nxos_vpc.mac_bpdu_source_version_2
  orphan_ports                                 = local.nxos_vpc.orphan_ports
  peer_gateway                                 = local.nxos_vpc.peer_gateway
  peer_gateway_exclude_vlan                    = local.nxos_vpc.peer_gateway_exclude_vlan
  peer_ip                                      = local.nxos_vpc.peer_ip
  peer_switch                                  = local.nxos_vpc.peer_switch
  peerlink_admin_state                         = local.nxos_vpc.peerlink_admin_state
  peerlink_description                         = local.nxos_vpc.peerlink_description
  peerlink_interface_id                        = local.nxos_vpc.peerlink_interface_id
  role_priority                                = local.nxos_vpc.role_priority
  sys_mac                                      = local.nxos_vpc.sys_mac
  system_priority                              = local.nxos_vpc.system_priority
  track                                        = local.nxos_vpc.track
  virtual_ip                                   = local.nxos_vpc.virtual_ip
}
