# 532 · resource sdwan_dns_security_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a DNS Security Policy Definition .
# Reads models/sdwan_dns_security_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_532 = yamldecode(file("${path.module}/../models/sdwan_dns_security_policy_definition.yml"))["sdwan_dns_security_policy_definition"]
}

resource "sdwan_dns_security_policy_definition" "n532" {
  cisco_sig_credentials_feature_template_id = local.m_532["cisco_sig_credentials_feature_template_id"]
  cisco_sig_credentials_feature_template_version = local.m_532["cisco_sig_credentials_feature_template_version"]
  custom_dns_server_ip = local.m_532["custom_dns_server_ip"]
  description = local.m_532["description"]
  dnscrypt = local.m_532["dnscrypt"]
  domain_list_id = local.m_532["domain_list_id"]
  domain_list_version = local.m_532["domain_list_version"]
  local_domain_bypass_enabled = local.m_532["local_domain_bypass_enabled"]
  match_all_vpn = local.m_532["match_all_vpn"]
  name = local.m_532["name"]
  target_vpns = local.m_532["target_vpns"]
  umbrella_dns_default = local.m_532["umbrella_dns_default"]
}
