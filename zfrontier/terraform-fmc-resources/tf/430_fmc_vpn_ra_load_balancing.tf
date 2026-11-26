# 430 · resource fmc_vpn_ra_load_balancing · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) Load Balancing settings.
# Reads models/fmc_vpn_ra_load_balancing.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_430 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_load_balancing.yml"))["fmc_vpn_ra_load_balancing"]
}

resource "fmc_vpn_ra_load_balancing" "n430" {
  domain                                  = local.m_430["domain"]
  enabled                                 = local.m_430["enabled"]
  ikev2_redirect_phase                    = local.m_430["ikev2_redirect_phase"]
  interface_id                            = local.m_430["interface_id"]
  ipsec                                   = local.m_430["ipsec"]
  ipsec_encryption_key                    = try(var.secrets["fmc_vpn_ra_load_balancing.ipsec_encryption_key"], local.m_430["ipsec_encryption_key"])
  ipv4_group_address                      = local.m_430["ipv4_group_address"]
  ipv6_group_address                      = local.m_430["ipv6_group_address"]
  port                                    = local.m_430["port"]
  send_fqdn_to_peer_devices_instead_of_ip = local.m_430["send_fqdn_to_peer_devices_instead_of_ip"]
  vpn_ra_id                               = local.m_430["vpn_ra_id"]
}
