# 526 · resource sdwan_vpn_membership_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a VPN Membership Policy Definition .
# Reads models/sdwan_vpn_membership_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_526 = yamldecode(file("${path.module}/../models/sdwan_vpn_membership_policy_definition.yml"))["sdwan_vpn_membership_policy_definition"]
}

resource "sdwan_vpn_membership_policy_definition" "n526" {
  description = local.m_526["description"]
  name = local.m_526["name"]
  sites = local.m_526["sites"]
}
