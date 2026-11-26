# 099 · resource sdwan_policy_object_vpn_group · 3. Policy objects and custom applications
# This resource can manage a Policy Object VPN Group Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_vpn_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/sdwan_policy_object_vpn_group.yml"))["sdwan_policy_object_vpn_group"]
}

resource "sdwan_policy_object_vpn_group" "n099" {
  description = local.m_099["description"]
  entries = local.m_099["entries"]
  feature_profile_id = local.m_099["feature_profile_id"]
  name = local.m_099["name"]
}
