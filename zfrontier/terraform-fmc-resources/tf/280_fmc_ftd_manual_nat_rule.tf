# 280 · resource fmc_ftd_manual_nat_rule · 3. Policies
# This resource manages a FTD Manual NAT Rule.
# Reads models/fmc_ftd_manual_nat_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_280 = yamldecode(file("${path.module}/../models/fmc_ftd_manual_nat_rule.yml"))["fmc_ftd_manual_nat_rule"]
}

resource "fmc_ftd_manual_nat_rule" "n280" {
  description                       = local.m_280["description"]
  destination_interface_id          = local.m_280["destination_interface_id"]
  domain                            = local.m_280["domain"]
  enabled                           = local.m_280["enabled"]
  fall_through                      = local.m_280["fall_through"]
  ftd_nat_policy_id                 = local.m_280["ftd_nat_policy_id"]
  interface_in_original_destination = local.m_280["interface_in_original_destination"]
  interface_in_translated_source    = local.m_280["interface_in_translated_source"]
  ipv6                              = local.m_280["ipv6"]
  nat_type                          = local.m_280["nat_type"]
  net_to_net                        = local.m_280["net_to_net"]
  no_proxy_arp                      = local.m_280["no_proxy_arp"]
  original_destination_id           = local.m_280["original_destination_id"]
  original_destination_port_id      = local.m_280["original_destination_port_id"]
  original_source_id                = local.m_280["original_source_id"]
  original_source_port_id           = local.m_280["original_source_port_id"]
  pat_address_object_id             = local.m_280["pat_address_object_id"]
  pat_block_allocation              = local.m_280["pat_block_allocation"]
  pat_extended_table                = local.m_280["pat_extended_table"]
  pat_flat_port_range               = local.m_280["pat_flat_port_range"]
  pat_include_reserved_ports        = local.m_280["pat_include_reserved_ports"]
  pat_round_robin_allocation        = local.m_280["pat_round_robin_allocation"]
  pat_use_interface_address         = local.m_280["pat_use_interface_address"]
  route_lookup                      = local.m_280["route_lookup"]
  section                           = local.m_280["section"]
  source_interface_id               = local.m_280["source_interface_id"]
  translate_dns                     = local.m_280["translate_dns"]
  translated_destination_id         = local.m_280["translated_destination_id"]
  translated_destination_port_id    = local.m_280["translated_destination_port_id"]
  translated_source_id              = local.m_280["translated_source_id"]
  translated_source_port_id         = local.m_280["translated_source_port_id"]
  unidirectional                    = local.m_280["unidirectional"]
}
