# 177 · resource catalystcenter_wireless_pre_auth_acl · 8. Wireless
# This resource manages wireless Pre-Auth ACLs. Pre-Auth ACLs define the traffic permitted before a client is fully authenticated, used by Guest Web-Auth (CWA/EWA) and Enterprise-Posturing SSIDs. Available in Catalyst Center 3.x.
# Reads models/catalystcenter_wireless_pre_auth_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_177 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_pre_auth_acl.yml"))["catalystcenter_wireless_pre_auth_acl"]
}

resource "catalystcenter_wireless_pre_auth_acl" "n177" {
  acl_list_name = local.m_177["acl_list_name"]
  acl_name = local.m_177["acl_name"]
  include_auto_generated_rules = local.m_177["include_auto_generated_rules"]
  ip_acl_rules = local.m_177["ip_acl_rules"]
  ipv6_acl_enabled = local.m_177["ipv6_acl_enabled"]
  walled_garden_urls = local.m_177["walled_garden_urls"]
}
