# 440 · resource fmc_vpn_s2s_ike_settings · 5. VPN
# This resource manages FTD Site-to-Site (S2S) Virtual Private Networks (VPNs) IKEv1 and IKEv2 settings. Either/both IKEv1/IKEv2 must be configured. Object deletion will not remove whole configuration, not to violate any dependencies that still may exist.
# Reads models/fmc_vpn_s2s_ike_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_440 = yamldecode(file("${path.module}/../models/fmc_vpn_s2s_ike_settings.yml"))["fmc_vpn_s2s_ike_settings"]
}

resource "fmc_vpn_s2s_ike_settings" "n440" {
  domain                                 = local.m_440["domain"]
  ikev1_authentication_type              = local.m_440["ikev1_authentication_type"]
  ikev1_automatic_pre_shared_key_length  = local.m_440["ikev1_automatic_pre_shared_key_length"]
  ikev1_certificate_id                   = local.m_440["ikev1_certificate_id"]
  ikev1_manual_pre_shared_key            = try(var.secrets["fmc_vpn_s2s_ike_settings.ikev1_manual_pre_shared_key"], local.m_440["ikev1_manual_pre_shared_key"])
  ikev1_policies                         = local.m_440["ikev1_policies"]
  ikev2_authentication_type              = local.m_440["ikev2_authentication_type"]
  ikev2_automatic_pre_shared_key_length  = local.m_440["ikev2_automatic_pre_shared_key_length"]
  ikev2_certificate_id                   = local.m_440["ikev2_certificate_id"]
  ikev2_enforce_hex_based_pre_shared_key = local.m_440["ikev2_enforce_hex_based_pre_shared_key"]
  ikev2_manual_pre_shared_key            = try(var.secrets["fmc_vpn_s2s_ike_settings.ikev2_manual_pre_shared_key"], local.m_440["ikev2_manual_pre_shared_key"])
  ikev2_policies                         = local.m_440["ikev2_policies"]
  vpn_s2s_id                             = local.m_440["vpn_s2s_id"]
}
