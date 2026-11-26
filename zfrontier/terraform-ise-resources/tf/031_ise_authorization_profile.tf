# 031 · resource ise_authorization_profile · 5. Network access
# This resource can manage an authorization profiles policy element.
# Reads models/ise_authorization_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/ise_authorization_profile.yml"))["ise_authorization_profile"]
}

resource "ise_authorization_profile" "n031" {
  access_type                                           = local.m_031["access_type"]
  acl                                                   = local.m_031["acl"]
  advanced_attributes                                   = local.m_031["advanced_attributes"]
  agentless_posture                                     = local.m_031["agentless_posture"]
  airespace_acl                                         = local.m_031["airespace_acl"]
  airespace_ipv6_acl                                    = local.m_031["airespace_ipv6_acl"]
  asa_vpn                                               = local.m_031["asa_vpn"]
  auto_smart_port                                       = local.m_031["auto_smart_port"]
  avc_profile                                           = local.m_031["avc_profile"]
  dacl_name                                             = local.m_031["dacl_name"]
  description                                           = local.m_031["description"]
  easywired_session_candidate                           = local.m_031["easywired_session_candidate"]
  interface_template                                    = local.m_031["interface_template"]
  ipv6_acl_filter                                       = local.m_031["ipv6_acl_filter"]
  ipv6_dacl_name                                        = local.m_031["ipv6_dacl_name"]
  mac_sec_policy                                        = local.m_031["mac_sec_policy"]
  name                                                  = local.m_031["name"]
  neat                                                  = local.m_031["neat"]
  profile_name                                          = local.m_031["profile_name"]
  reauthentication_connectivity                         = local.m_031["reauthentication_connectivity"]
  reauthentication_timer                                = local.m_031["reauthentication_timer"]
  service_template                                      = local.m_031["service_template"]
  track_movement                                        = local.m_031["track_movement"]
  unique_identifier                                     = local.m_031["unique_identifier"]
  vlan_name_id                                          = local.m_031["vlan_name_id"]
  vlan_tag_id                                           = local.m_031["vlan_tag_id"]
  voice_domain_permission                               = local.m_031["voice_domain_permission"]
  web_auth                                              = local.m_031["web_auth"]
  web_redirection_acl                                   = local.m_031["web_redirection_acl"]
  web_redirection_display_certificates_renewal_messages = local.m_031["web_redirection_display_certificates_renewal_messages"]
  web_redirection_portal_name                           = local.m_031["web_redirection_portal_name"]
  web_redirection_static_ip_host_name_fqdn              = local.m_031["web_redirection_static_ip_host_name_fqdn"]
  web_redirection_type                                  = local.m_031["web_redirection_type"]
}
