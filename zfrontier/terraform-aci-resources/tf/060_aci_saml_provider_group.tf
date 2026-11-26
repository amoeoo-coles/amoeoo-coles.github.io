# 060 · resource aci_saml_provider_group · 1. System and fabric setup
# Manages ACI SAML Provider Group
# APIC class: not collected · DN: not collected
# Reads models/aci_saml_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_060 = yamldecode(file("${path.module}/../models/aci_saml_provider_group.yml"))["aci_saml_provider_group"]
}

resource "aci_saml_provider_group" "n060" {
  annotation  = local.m_060["annotation"]
  description = local.m_060["description"]
  name        = local.m_060["name"]
  name_alias  = local.m_060["name_alias"]
}
