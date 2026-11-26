# 402 · resource sdwan_vpn_list_policy_object · 10. (Classic) policy objects
# This resource can manage a VPN List Policy Object .
# Reads models/sdwan_vpn_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_402 = yamldecode(file("${path.module}/../models/sdwan_vpn_list_policy_object.yml"))["sdwan_vpn_list_policy_object"]
}

resource "sdwan_vpn_list_policy_object" "n402" {
  entries = local.m_402["entries"]
  name = local.m_402["name"]
}
