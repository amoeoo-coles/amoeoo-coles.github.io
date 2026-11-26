# 218 · resource fmc_single_sign_on_server · 2. Objects
# This resource manages a Single Sign On Server.
# Reads models/fmc_single_sign_on_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_218 = yamldecode(file("${path.module}/../models/fmc_single_sign_on_server.yml"))["fmc_single_sign_on_server"]
}

resource "fmc_single_sign_on_server" "n218" {
  base_url                                                 = local.m_218["base_url"]
  domain                                                   = local.m_218["domain"]
  identity_provider_accessible_only_on_internal_network    = local.m_218["identity_provider_accessible_only_on_internal_network"]
  identity_provider_certificate_id                         = local.m_218["identity_provider_certificate_id"]
  identity_provider_certificate_name                       = local.m_218["identity_provider_certificate_name"]
  identity_provider_entity_id_url                          = local.m_218["identity_provider_entity_id_url"]
  logout_url                                               = local.m_218["logout_url"]
  name                                                     = local.m_218["name"]
  request_identity_provider_reauthentication_at_each_login = local.m_218["request_identity_provider_reauthentication_at_each_login"]
  request_signature_type                                   = local.m_218["request_signature_type"]
  request_timeout                                          = local.m_218["request_timeout"]
  service_provider_certificate_id                          = local.m_218["service_provider_certificate_id"]
  sso_url                                                  = local.m_218["sso_url"]
}
