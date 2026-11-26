# 031 · resource aci_default_authentication · 1. System and fabric setup
# Manages ACI Default Authentication Method for all Logins
# APIC class: not collected · DN: not collected
# Reads models/aci_default_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/aci_default_authentication.yml"))["aci_default_authentication"]
}

resource "aci_default_authentication" "n031" {
  annotation     = local.m_031["annotation"]
  description    = local.m_031["description"]
  fallback_check = local.m_031["fallback_check"]
  name_alias     = local.m_031["name_alias"]
  provider_group = local.m_031["provider_group"]
  realm          = local.m_031["realm"]
  realm_sub_type = local.m_031["realm_sub_type"]
}
