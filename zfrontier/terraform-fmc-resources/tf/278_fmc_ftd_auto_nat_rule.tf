# 278 · resource fmc_ftd_auto_nat_rule · 3. Policies
# This resource manages a FTD Auto NAT Rule.
# Reads models/fmc_ftd_auto_nat_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_278 = yamldecode(file("${path.module}/../models/fmc_ftd_auto_nat_rule.yml"))["fmc_ftd_auto_nat_rule"]
}

resource "fmc_ftd_auto_nat_rule" "n278" {
  destination_interface_id                    = local.m_278["destination_interface_id"]
  domain                                      = local.m_278["domain"]
  fall_through                                = local.m_278["fall_through"]
  ftd_nat_policy_id                           = local.m_278["ftd_nat_policy_id"]
  ipv6                                        = local.m_278["ipv6"]
  nat_type                                    = local.m_278["nat_type"]
  net_to_net                                  = local.m_278["net_to_net"]
  no_proxy_arp                                = local.m_278["no_proxy_arp"]
  original_network_id                         = local.m_278["original_network_id"]
  original_port                               = local.m_278["original_port"]
  pat_address_object_id                       = local.m_278["pat_address_object_id"]
  pat_block_allocation                        = local.m_278["pat_block_allocation"]
  pat_extended_table                          = local.m_278["pat_extended_table"]
  pat_flat_port_range                         = local.m_278["pat_flat_port_range"]
  pat_include_reserved_ports                  = local.m_278["pat_include_reserved_ports"]
  pat_round_robin_allocation                  = local.m_278["pat_round_robin_allocation"]
  pat_use_interface_address                   = local.m_278["pat_use_interface_address"]
  perform_route_lookup                        = local.m_278["perform_route_lookup"]
  protocol                                    = local.m_278["protocol"]
  source_interface_id                         = local.m_278["source_interface_id"]
  translate_dns                               = local.m_278["translate_dns"]
  translated_network_id                       = local.m_278["translated_network_id"]
  translated_network_is_destination_interface = local.m_278["translated_network_is_destination_interface"]
  translated_port                             = local.m_278["translated_port"]
}
