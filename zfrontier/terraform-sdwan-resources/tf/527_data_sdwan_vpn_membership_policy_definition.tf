# 527 · data source sdwan_vpn_membership_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the VPN Membership Policy Definition .
# Reads models/data_sdwan_vpn_membership_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_527 = yamldecode(file("${path.module}/../models/data_sdwan_vpn_membership_policy_definition.yml"))["data_sdwan_vpn_membership_policy_definition"]
}

data "sdwan_vpn_membership_policy_definition" "n527" {
  id = local.m_527["id"]
}

output "n527_data_sdwan_vpn_membership_policy_definition_id" {
  value = data.sdwan_vpn_membership_policy_definition.n527.id
}
