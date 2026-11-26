# 026 nxos_dhcp — 5. Networks and L2VNI
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/dhcp
# Reads ../models/nxos_dhcp.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_dhcp = yamldecode(file("${path.module}/../models/nxos_dhcp.yml"))["nxos_dhcp"]
}

resource "nxos_dhcp" "this" {
  admin_state                                 = local.nxos_dhcp.admin_state
  dai_interfaces                              = local.nxos_dhcp.dai_interfaces
  dai_log_buffer_entries                      = local.nxos_dhcp.dai_log_buffer_entries
  dai_validate_destination                    = local.nxos_dhcp.dai_validate_destination
  dai_validate_ip                             = local.nxos_dhcp.dai_validate_ip
  dai_validate_source                         = local.nxos_dhcp.dai_validate_source
  dai_vlans                                   = local.nxos_dhcp.dai_vlans
  deletion_policy                             = local.nxos_dhcp.deletion_policy
  device                                      = local.nxos_dhcp.device
  ip_source_bindings                          = local.nxos_dhcp.ip_source_bindings
  ip_source_guard_excluded_vlans              = local.nxos_dhcp.ip_source_guard_excluded_vlans
  ip_source_guard_interfaces                  = local.nxos_dhcp.ip_source_guard_interfaces
  ipv6_relay_information_option_vpn           = local.nxos_dhcp.ipv6_relay_information_option_vpn
  ipv6_relay_option79                         = local.nxos_dhcp.ipv6_relay_option79
  ipv6_relay_option_type_cisco                = local.nxos_dhcp.ipv6_relay_option_type_cisco
  ipv6_source_interface                       = local.nxos_dhcp.ipv6_source_interface
  ipv6_source_interface_admin_state           = local.nxos_dhcp.ipv6_source_interface_admin_state
  packet_strict_validation                    = local.nxos_dhcp.packet_strict_validation
  relay_dai                                   = local.nxos_dhcp.relay_dai
  relay_information_option                    = local.nxos_dhcp.relay_information_option
  relay_information_option_server_id_override = local.nxos_dhcp.relay_information_option_server_id_override
  relay_information_option_trust              = local.nxos_dhcp.relay_information_option_trust
  relay_information_option_vpn                = local.nxos_dhcp.relay_information_option_vpn
  relay_information_trust_all                 = local.nxos_dhcp.relay_information_trust_all
  relay_interfaces                            = local.nxos_dhcp.relay_interfaces
  relay_sub_option_circuit_id_customized      = local.nxos_dhcp.relay_sub_option_circuit_id_customized
  relay_sub_option_circuit_id_format_string   = local.nxos_dhcp.relay_sub_option_circuit_id_format_string
  relay_sub_option_format_non_tlv             = local.nxos_dhcp.relay_sub_option_format_non_tlv
  relay_sub_option_type_cisco                 = local.nxos_dhcp.relay_sub_option_type_cisco
  relay_v4_over_v6                            = local.nxos_dhcp.relay_v4_over_v6
  relay_v6_iapd_route_add                     = local.nxos_dhcp.relay_v6_iapd_route_add
  smart_relay_global                          = local.nxos_dhcp.smart_relay_global
  snoop_sub_option_circuit_id_format_string   = local.nxos_dhcp.snoop_sub_option_circuit_id_format_string
  snooping                                    = local.nxos_dhcp.snooping
  snooping_information_option                 = local.nxos_dhcp.snooping_information_option
  snooping_interfaces                         = local.nxos_dhcp.snooping_interfaces
  snooping_sub_option_format_non_tlv          = local.nxos_dhcp.snooping_sub_option_format_non_tlv
  snooping_verify_mac_address                 = local.nxos_dhcp.snooping_verify_mac_address
  snooping_vlans                              = local.nxos_dhcp.snooping_vlans
  source_interface                            = local.nxos_dhcp.source_interface
  v4_relay                                    = local.nxos_dhcp.v4_relay
  v6_relay                                    = local.nxos_dhcp.v6_relay
  v6_smart_relay_global                       = local.nxos_dhcp.v6_smart_relay_global
}
