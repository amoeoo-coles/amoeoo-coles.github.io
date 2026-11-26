# 426 · resource fmc_vpn_ra_ipsec_ike_parameters · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) IPSec/IKEv2 Parameters.
# Reads models/fmc_vpn_ra_ipsec_ike_parameters.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_426 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_ipsec_ike_parameters.yml"))["fmc_vpn_ra_ipsec_ike_parameters"]
}

resource "fmc_vpn_ra_ipsec_ike_parameters" "n426" {
  domain                                                    = local.m_426["domain"]
  ikev2_cookie_challenge                                    = local.m_426["ikev2_cookie_challenge"]
  ikev2_do_not_reboot_until_all_sessions_are_terminated     = local.m_426["ikev2_do_not_reboot_until_all_sessions_are_terminated"]
  ikev2_identity_sent_to_peer                               = local.m_426["ikev2_identity_sent_to_peer"]
  ikev2_maximum_number_of_sas_allowed                       = local.m_426["ikev2_maximum_number_of_sas_allowed"]
  ikev2_notification_on_tunnel_disconnect                   = local.m_426["ikev2_notification_on_tunnel_disconnect"]
  ikev2_number_of_sas_allowed_in_negotiation                = local.m_426["ikev2_number_of_sas_allowed_in_negotiation"]
  ikev2_threshold_to_challenge_incoming_cookies             = local.m_426["ikev2_threshold_to_challenge_incoming_cookies"]
  ipsec_path_maximum_transmission_unit_aging                = local.m_426["ipsec_path_maximum_transmission_unit_aging"]
  ipsec_path_maximum_transmission_unit_aging_reset_interval = local.m_426["ipsec_path_maximum_transmission_unit_aging_reset_interval"]
  nat_keepalive_message_traversal                           = local.m_426["nat_keepalive_message_traversal"]
  nat_keepalive_message_traversal_interval                  = local.m_426["nat_keepalive_message_traversal_interval"]
  vpn_ra_id                                                 = local.m_426["vpn_ra_id"]
}
