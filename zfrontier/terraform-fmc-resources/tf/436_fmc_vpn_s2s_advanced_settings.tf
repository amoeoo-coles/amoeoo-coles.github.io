# 436 · resource fmc_vpn_s2s_advanced_settings · 5. VPN
# This resource manages FTD Site-to-Site (S2S) Virtual Private Networks (VPNs) Advanced settings.
# Reads models/fmc_vpn_s2s_advanced_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_436 = yamldecode(file("${path.module}/../models/fmc_vpn_s2s_advanced_settings.yml"))["fmc_vpn_s2s_advanced_settings"]
}

resource "fmc_vpn_s2s_advanced_settings" "n436" {
  bypass_access_control_policy_for_decrypted_traffic                  = local.m_436["bypass_access_control_policy_for_decrypted_traffic"]
  cert_use_certificate_map_configured_in_endpoint_to_determine_tunnel = local.m_436["cert_use_certificate_map_configured_in_endpoint_to_determine_tunnel"]
  cert_use_ike_identity_to_determine_tunnel                           = local.m_436["cert_use_ike_identity_to_determine_tunnel"]
  cert_use_ou_to_determine_tunnel                                     = local.m_436["cert_use_ou_to_determine_tunnel"]
  cert_use_peer_ip_address_to_determine_tunnel                        = local.m_436["cert_use_peer_ip_address_to_determine_tunnel"]
  domain                                                              = local.m_436["domain"]
  ike_aggressive_mode                                                 = local.m_436["ike_aggressive_mode"]
  ike_identity_sent_to_peers                                          = local.m_436["ike_identity_sent_to_peers"]
  ike_keepalive                                                       = local.m_436["ike_keepalive"]
  ike_keepalive_retry_interval                                        = local.m_436["ike_keepalive_retry_interval"]
  ike_keepalive_threshold                                             = local.m_436["ike_keepalive_threshold"]
  ike_notification_on_tunnel_disconnect                               = local.m_436["ike_notification_on_tunnel_disconnect"]
  ike_peer_identity_validation                                        = local.m_436["ike_peer_identity_validation"]
  ikev2_cookie_challenge                                              = local.m_436["ikev2_cookie_challenge"]
  ikev2_maximum_number_of_sas_allowed                                 = local.m_436["ikev2_maximum_number_of_sas_allowed"]
  ikev2_number_of_sas_allowed_in_negotiation                          = local.m_436["ikev2_number_of_sas_allowed_in_negotiation"]
  ikev2_threshold_to_challenge_incoming_cookies                       = local.m_436["ikev2_threshold_to_challenge_incoming_cookies"]
  ipsec_fragmentation_before_encryption                               = local.m_436["ipsec_fragmentation_before_encryption"]
  ipsec_path_maximum_transmission_unit_aging_reset_interval           = local.m_436["ipsec_path_maximum_transmission_unit_aging_reset_interval"]
  nat_keepalive_message_traversal                                     = local.m_436["nat_keepalive_message_traversal"]
  nat_keepalive_message_traversal_interval                            = local.m_436["nat_keepalive_message_traversal_interval"]
  sgt_propagation_over_virtual_tunnel_interface                       = local.m_436["sgt_propagation_over_virtual_tunnel_interface"]
  spoke_to_spoke_connectivity_through_hub                             = local.m_436["spoke_to_spoke_connectivity_through_hub"]
  vpn_idle_timeout                                                    = local.m_436["vpn_idle_timeout"]
  vpn_idle_timeout_value                                              = local.m_436["vpn_idle_timeout_value"]
  vpn_s2s_id                                                          = local.m_436["vpn_s2s_id"]
}
