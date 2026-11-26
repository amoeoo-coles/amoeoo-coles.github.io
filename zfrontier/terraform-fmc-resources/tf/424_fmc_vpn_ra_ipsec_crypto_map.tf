# 424 · resource fmc_vpn_ra_ipsec_crypto_map · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) IPSec Crypto Maps.
# Reads models/fmc_vpn_ra_ipsec_crypto_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_424 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_ipsec_crypto_map.yml"))["fmc_vpn_ra_ipsec_crypto_map"]
}

resource "fmc_vpn_ra_ipsec_crypto_map" "n424" {
  client_services                       = local.m_424["client_services"]
  client_services_port                  = local.m_424["client_services_port"]
  do_not_fragment_policy                = local.m_424["do_not_fragment_policy"]
  domain                                = local.m_424["domain"]
  ikev2_ipsec_proposals                 = local.m_424["ikev2_ipsec_proposals"]
  interface_id                          = local.m_424["interface_id"]
  lifetime_duration                     = local.m_424["lifetime_duration"]
  lifetime_size                         = local.m_424["lifetime_size"]
  perfect_forward_secrecy               = local.m_424["perfect_forward_secrecy"]
  perfect_forward_secrecy_modulus_group = local.m_424["perfect_forward_secrecy_modulus_group"]
  reverse_route_injection               = local.m_424["reverse_route_injection"]
  tfc                                   = local.m_424["tfc"]
  tfc_burst_bytes                       = local.m_424["tfc_burst_bytes"]
  tfc_payload_bytes                     = local.m_424["tfc_payload_bytes"]
  tfc_timeout                           = local.m_424["tfc_timeout"]
  validate_incoming_icmp_error_messages = local.m_424["validate_incoming_icmp_error_messages"]
  vpn_ra_id                             = local.m_424["vpn_ra_id"]
}
