# 340 · resource sdwan_dns_security_policy · 9. Configuration, policy and topology groups
# This resource can manage a DNS Security Policy. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_dns_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_340 = yamldecode(file("${path.module}/../models/sdwan_dns_security_policy.yml"))["sdwan_dns_security_policy"]
}

resource "sdwan_dns_security_policy" "n340" {
  child_org_id = local.m_340["child_org_id"]
  description = local.m_340["description"]
  dns_crypt = local.m_340["dns_crypt"]
  dns_server_ip = local.m_340["dns_server_ip"]
  feature_profile_id = local.m_340["feature_profile_id"]
  local_domain_bypass_enabled = local.m_340["local_domain_bypass_enabled"]
  local_domain_bypass_list_id = local.m_340["local_domain_bypass_list_id"]
  match_all_vpn = local.m_340["match_all_vpn"]
  name = local.m_340["name"]
  target_vpns = local.m_340["target_vpns"]
  umbrella_default = local.m_340["umbrella_default"]
}
