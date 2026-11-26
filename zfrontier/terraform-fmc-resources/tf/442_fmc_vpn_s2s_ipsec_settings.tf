# 442 · resource fmc_vpn_s2s_ipsec_settings · 5. VPN
# This resource manages FTD Site-to-Site (S2S) Virtual Private Networks (VPNs) IPSEC settings.
# Reads models/fmc_vpn_s2s_ipsec_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_442 = yamldecode(file("${path.module}/../models/fmc_vpn_s2s_ipsec_settings.yml"))["fmc_vpn_s2s_ipsec_settings"]
}

resource "fmc_vpn_s2s_ipsec_settings" "n442" {
  crypto_map_type                           = local.m_442["crypto_map_type"]
  do_not_fragment_policy                    = local.m_442["do_not_fragment_policy"]
  domain                                    = local.m_442["domain"]
  ikev1_ipsec_proposals                     = local.m_442["ikev1_ipsec_proposals"]
  ikev2_ipsec_proposals                     = local.m_442["ikev2_ipsec_proposals"]
  ikev2_mode                                = local.m_442["ikev2_mode"]
  lifetime_duration                         = local.m_442["lifetime_duration"]
  lifetime_size                             = local.m_442["lifetime_size"]
  perfect_forward_secrecy                   = local.m_442["perfect_forward_secrecy"]
  perfect_forward_secrecy_modulus_group     = local.m_442["perfect_forward_secrecy_modulus_group"]
  reverse_route_injection                   = local.m_442["reverse_route_injection"]
  security_association_strength_enforcement = local.m_442["security_association_strength_enforcement"]
  tfc                                       = local.m_442["tfc"]
  tfc_burst_bytes                           = local.m_442["tfc_burst_bytes"]
  tfc_payload_bytes                         = local.m_442["tfc_payload_bytes"]
  tfc_timeout                               = local.m_442["tfc_timeout"]
  validate_incoming_icmp_error_messages     = local.m_442["validate_incoming_icmp_error_messages"]
  vpn_s2s_id                                = local.m_442["vpn_s2s_id"]
}
