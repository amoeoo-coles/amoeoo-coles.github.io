# 016 nxos_nvo — 3. VTEP and overlay
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/nvo
# Reads ../models/nxos_nvo.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_nvo = yamldecode(file("${path.module}/../models/nxos_nvo.yml"))["nxos_nvo"]
}

resource "nxos_nvo" "this" {
  advertise_evpn_multicast_state                       = local.nxos_nvo.advertise_evpn_multicast_state
  deletion_policy                                      = local.nxos_nvo.deletion_policy
  device                                               = local.nxos_nvo.device
  evpn_multihoming_delay_restore_time                  = local.nxos_nvo.evpn_multihoming_delay_restore_time
  evpn_multihoming_df_election_mode                    = local.nxos_nvo.evpn_multihoming_df_election_mode
  evpn_multihoming_df_election_time                    = local.nxos_nvo.evpn_multihoming_df_election_time
  evpn_multihoming_ead_evi_route                       = local.nxos_nvo.evpn_multihoming_ead_evi_route
  evpn_multihoming_frr_anycast_source_ip               = local.nxos_nvo.evpn_multihoming_frr_anycast_source_ip
  evpn_multihoming_state                               = local.nxos_nvo.evpn_multihoming_state
  evpn_multihoming_system_mac                          = local.nxos_nvo.evpn_multihoming_system_mac
  evpn_multisite_border_gateway_dci_advertise_pip      = local.nxos_nvo.evpn_multisite_border_gateway_dci_advertise_pip
  evpn_multisite_border_gateway_delay_restore_time     = local.nxos_nvo.evpn_multisite_border_gateway_delay_restore_time
  evpn_multisite_border_gateway_df_election_time       = local.nxos_nvo.evpn_multisite_border_gateway_df_election_time
  evpn_multisite_border_gateway_fabric_advertise_pip   = local.nxos_nvo.evpn_multisite_border_gateway_fabric_advertise_pip
  evpn_multisite_border_gateway_site_id                = local.nxos_nvo.evpn_multisite_border_gateway_site_id
  evpn_multisite_border_gateway_split_horizon_per_site = local.nxos_nvo.evpn_multisite_border_gateway_split_horizon_per_site
  evpn_multisite_border_gateway_state                  = local.nxos_nvo.evpn_multisite_border_gateway_state
  evpn_storm_controls                                  = local.nxos_nvo.evpn_storm_controls
  nve_interfaces                                       = local.nxos_nvo.nve_interfaces
  vxlan_udp_port                                       = local.nxos_nvo.vxlan_udp_port
  vxlan_udp_source_port_mode                           = local.nxos_nvo.vxlan_udp_source_port_mode
}
