# 091 · resource ise_tacacs_profile · 6. Device administration
# This resource can manage a TACACS Profile.
# Reads models/ise_tacacs_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/ise_tacacs_profile.yml"))["ise_tacacs_profile"]
}

resource "ise_tacacs_profile" "n091" {
  description = local.m_091["description"]
  name = local.m_091["name"]
  session_attributes = local.m_091["session_attributes"]
}
