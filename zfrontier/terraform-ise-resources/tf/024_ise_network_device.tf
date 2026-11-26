# 024 · resource ise_network_device · 3. Network resources
# This resource can manage a Network Device.
# Reads models/ise_network_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/ise_network_device.yml"))["ise_network_device"]
}

resource "ise_network_device" "n024" {
  authentication_dtls_required                                = local.m_024["authentication_dtls_required"]
  authentication_enable_key_wrap                              = local.m_024["authentication_enable_key_wrap"]
  authentication_enable_multi_secret                          = local.m_024["authentication_enable_multi_secret"]
  authentication_encryption_key                               = local.m_024["authentication_encryption_key"]
  authentication_encryption_key_format                        = local.m_024["authentication_encryption_key_format"]
  authentication_encryption_key_wo                            = try(var.secrets["ise_network_device.authentication_encryption_key_wo"], local.m_024["authentication_encryption_key_wo"])
  authentication_encryption_key_wo_version                    = local.m_024["authentication_encryption_key_wo_version"]
  authentication_message_authenticator_code_key               = local.m_024["authentication_message_authenticator_code_key"]
  authentication_message_authenticator_code_key_wo            = try(var.secrets["ise_network_device.authentication_message_authenticator_code_key_wo"], local.m_024["authentication_message_authenticator_code_key_wo"])
  authentication_message_authenticator_code_key_wo_version    = local.m_024["authentication_message_authenticator_code_key_wo_version"]
  authentication_network_protocol                             = local.m_024["authentication_network_protocol"]
  authentication_radius_shared_secret                         = local.m_024["authentication_radius_shared_secret"]
  authentication_radius_shared_secret_wo                      = try(var.secrets["ise_network_device.authentication_radius_shared_secret_wo"], local.m_024["authentication_radius_shared_secret_wo"])
  authentication_radius_shared_secret_wo_version              = local.m_024["authentication_radius_shared_secret_wo_version"]
  authentication_second_radius_shared_secret                  = local.m_024["authentication_second_radius_shared_secret"]
  authentication_second_radius_shared_secret_wo               = try(var.secrets["ise_network_device.authentication_second_radius_shared_secret_wo"], local.m_024["authentication_second_radius_shared_secret_wo"])
  authentication_second_radius_shared_secret_wo_version       = local.m_024["authentication_second_radius_shared_secret_wo_version"]
  coa_port                                                    = local.m_024["coa_port"]
  description                                                 = local.m_024["description"]
  dtls_dns_name                                               = local.m_024["dtls_dns_name"]
  ips                                                         = local.m_024["ips"]
  model_name                                                  = local.m_024["model_name"]
  name                                                        = local.m_024["name"]
  network_device_groups                                       = local.m_024["network_device_groups"]
  profile_name                                                = local.m_024["profile_name"]
  snmp_auth_password                                          = local.m_024["snmp_auth_password"]
  snmp_auth_password_wo                                       = try(var.secrets["ise_network_device.snmp_auth_password_wo"], local.m_024["snmp_auth_password_wo"])
  snmp_auth_password_wo_version                               = local.m_024["snmp_auth_password_wo_version"]
  snmp_auth_protocol                                          = local.m_024["snmp_auth_protocol"]
  snmp_link_trap_query                                        = local.m_024["snmp_link_trap_query"]
  snmp_mac_trap_query                                         = local.m_024["snmp_mac_trap_query"]
  snmp_originating_policy_service_node                        = local.m_024["snmp_originating_policy_service_node"]
  snmp_polling_interval                                       = local.m_024["snmp_polling_interval"]
  snmp_privacy_password                                       = local.m_024["snmp_privacy_password"]
  snmp_privacy_password_wo                                    = try(var.secrets["ise_network_device.snmp_privacy_password_wo"], local.m_024["snmp_privacy_password_wo"])
  snmp_privacy_password_wo_version                            = local.m_024["snmp_privacy_password_wo_version"]
  snmp_privacy_protocol                                       = local.m_024["snmp_privacy_protocol"]
  snmp_ro_community                                           = local.m_024["snmp_ro_community"]
  snmp_security_level                                         = local.m_024["snmp_security_level"]
  snmp_username                                               = local.m_024["snmp_username"]
  snmp_version                                                = local.m_024["snmp_version"]
  software_version                                            = local.m_024["software_version"]
  tacacs_connect_mode_options                                 = local.m_024["tacacs_connect_mode_options"]
  tacacs_shared_secret                                        = local.m_024["tacacs_shared_secret"]
  tacacs_shared_secret_wo                                     = try(var.secrets["ise_network_device.tacacs_shared_secret_wo"], local.m_024["tacacs_shared_secret_wo"])
  tacacs_shared_secret_wo_version                             = local.m_024["tacacs_shared_secret_wo_version"]
  trustsec_coa_source_host                                    = local.m_024["trustsec_coa_source_host"]
  trustsec_device_id                                          = local.m_024["trustsec_device_id"]
  trustsec_device_password                                    = local.m_024["trustsec_device_password"]
  trustsec_device_password_wo                                 = try(var.secrets["ise_network_device.trustsec_device_password_wo"], local.m_024["trustsec_device_password_wo"])
  trustsec_device_password_wo_version                         = local.m_024["trustsec_device_password_wo_version"]
  trustsec_download_environment_data_every_x_seconds          = local.m_024["trustsec_download_environment_data_every_x_seconds"]
  trustsec_download_peer_authorization_policy_every_x_seconds = local.m_024["trustsec_download_peer_authorization_policy_every_x_seconds"]
  trustsec_download_sgacl_lists_every_x_seconds               = local.m_024["trustsec_download_sgacl_lists_every_x_seconds"]
  trustsec_enable_mode_password                               = local.m_024["trustsec_enable_mode_password"]
  trustsec_enable_mode_password_wo                            = try(var.secrets["ise_network_device.trustsec_enable_mode_password_wo"], local.m_024["trustsec_enable_mode_password_wo"])
  trustsec_enable_mode_password_wo_version                    = local.m_024["trustsec_enable_mode_password_wo_version"]
  trustsec_exec_mode_password                                 = local.m_024["trustsec_exec_mode_password"]
  trustsec_exec_mode_password_wo                              = try(var.secrets["ise_network_device.trustsec_exec_mode_password_wo"], local.m_024["trustsec_exec_mode_password_wo"])
  trustsec_exec_mode_password_wo_version                      = local.m_024["trustsec_exec_mode_password_wo_version"]
  trustsec_exec_mode_username                                 = local.m_024["trustsec_exec_mode_username"]
  trustsec_include_when_deploying_sgt_updates                 = local.m_024["trustsec_include_when_deploying_sgt_updates"]
  trustsec_other_sga_devices_to_trust_this_device             = local.m_024["trustsec_other_sga_devices_to_trust_this_device"]
  trustsec_re_authentication_every_x_seconds                  = local.m_024["trustsec_re_authentication_every_x_seconds"]
  trustsec_rest_api_password                                  = local.m_024["trustsec_rest_api_password"]
  trustsec_rest_api_password_wo                               = try(var.secrets["ise_network_device.trustsec_rest_api_password_wo"], local.m_024["trustsec_rest_api_password_wo"])
  trustsec_rest_api_password_wo_version                       = local.m_024["trustsec_rest_api_password_wo_version"]
  trustsec_rest_api_username                                  = local.m_024["trustsec_rest_api_username"]
  trustsec_send_configuration_to_device                       = local.m_024["trustsec_send_configuration_to_device"]
  trustsec_send_configuration_to_device_using                 = local.m_024["trustsec_send_configuration_to_device_using"]
}
