# 001 nxos_feature — 1. Global, fabric and features
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/feature
# Reads ../models/nxos_feature.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_feature = yamldecode(file("${path.module}/../models/nxos_feature.yml"))["nxos_feature"]
}

resource "nxos_feature" "this" {
  analytics                                = local.nxos_feature.analytics
  bash_shell                               = local.nxos_feature.bash_shell
  bfd                                      = local.nxos_feature.bfd
  bgp                                      = local.nxos_feature.bgp
  deletion_policy                          = local.nxos_feature.deletion_policy
  device                                   = local.nxos_feature.device
  dhcp                                     = local.nxos_feature.dhcp
  dot1x                                    = local.nxos_feature.dot1x
  eigrp                                    = local.nxos_feature.eigrp
  epbr                                     = local.nxos_feature.epbr
  evpn                                     = local.nxos_feature.evpn
  feature_sets                             = local.nxos_feature.feature_sets
  grpc                                     = local.nxos_feature.grpc
  hmm                                      = local.nxos_feature.hmm
  hsrp                                     = local.nxos_feature.hsrp
  interface_vlan                           = local.nxos_feature.interface_vlan
  isis                                     = local.nxos_feature.isis
  lacp                                     = local.nxos_feature.lacp
  lldp                                     = local.nxos_feature.lldp
  macsec                                   = local.nxos_feature.macsec
  mpls_l3vpn                               = local.nxos_feature.mpls_l3vpn
  mpls_segment_routing                     = local.nxos_feature.mpls_segment_routing
  mpls_segment_routing_traffic_engineering = local.nxos_feature.mpls_segment_routing_traffic_engineering
  msdp                                     = local.nxos_feature.msdp
  nat                                      = local.nxos_feature.nat
  netconf                                  = local.nxos_feature.netconf
  netflow                                  = local.nxos_feature.netflow
  ngmvpn                                   = local.nxos_feature.ngmvpn
  ngoam                                    = local.nxos_feature.ngoam
  nv_overlay                               = local.nxos_feature.nv_overlay
  nxapi                                    = local.nxos_feature.nxapi
  openconfig                               = local.nxos_feature.openconfig
  ospf                                     = local.nxos_feature.ospf
  ospfv3                                   = local.nxos_feature.ospfv3
  pbr                                      = local.nxos_feature.pbr
  pim                                      = local.nxos_feature.pim
  poe                                      = local.nxos_feature.poe
  port_security                            = local.nxos_feature.port_security
  ptp                                      = local.nxos_feature.ptp
  pvlan                                    = local.nxos_feature.pvlan
  restconf                                 = local.nxos_feature.restconf
  scheduler                                = local.nxos_feature.scheduler
  scp_server                               = local.nxos_feature.scp_server
  security_group                           = local.nxos_feature.security_group
  service_acceleration                     = local.nxos_feature.service_acceleration
  sflow                                    = local.nxos_feature.sflow
  sftp_server                              = local.nxos_feature.sftp_server
  sla_responder                            = local.nxos_feature.sla_responder
  sla_sender                               = local.nxos_feature.sla_sender
  sla_twamp_server                         = local.nxos_feature.sla_twamp_server
  srv6                                     = local.nxos_feature.srv6
  ssh                                      = local.nxos_feature.ssh
  tacacs                                   = local.nxos_feature.tacacs
  telemetry                                = local.nxos_feature.telemetry
  telnet                                   = local.nxos_feature.telnet
  tunnel                                   = local.nxos_feature.tunnel
  udld                                     = local.nxos_feature.udld
  vn_segment                               = local.nxos_feature.vn_segment
  vpc                                      = local.nxos_feature.vpc
  vrrp                                     = local.nxos_feature.vrrp
  vrrpv3                                   = local.nxos_feature.vrrpv3
  vtp                                      = local.nxos_feature.vtp
}
