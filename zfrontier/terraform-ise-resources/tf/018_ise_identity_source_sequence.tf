# 018 · resource ise_identity_source_sequence · 2. Identity management
# This resource can manage an Identity Source Sequence.
# Reads models/ise_identity_source_sequence.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/ise_identity_source_sequence.yml"))["ise_identity_source_sequence"]
}

resource "ise_identity_source_sequence" "n018" {
  break_on_store_fail = local.m_018["break_on_store_fail"]
  certificate_authentication_profile = local.m_018["certificate_authentication_profile"]
  description = local.m_018["description"]
  identity_sources = local.m_018["identity_sources"]
  name = local.m_018["name"]
}
