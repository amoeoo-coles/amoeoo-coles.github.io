# 010 · resource ise_certificate_authentication_profile · 2. Identity management
# This resource can manage a Certificate Authentication Profile.
# Reads models/ise_certificate_authentication_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/ise_certificate_authentication_profile.yml"))["ise_certificate_authentication_profile"]
}

resource "ise_certificate_authentication_profile" "n010" {
  allowed_as_user_name         = local.m_010["allowed_as_user_name"]
  certificate_attribute_name   = local.m_010["certificate_attribute_name"]
  description                  = local.m_010["description"]
  external_identity_store_name = local.m_010["external_identity_store_name"]
  match_mode                   = local.m_010["match_mode"]
  name                         = local.m_010["name"]
  username_from                = local.m_010["username_from"]
}
