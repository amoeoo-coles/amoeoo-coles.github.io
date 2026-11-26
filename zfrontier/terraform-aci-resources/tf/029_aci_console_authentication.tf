# 029 · resource aci_console_authentication · 1. System and fabric setup
# Manages ACI Console Authentication
# APIC class: not collected · DN: not collected
# Reads models/aci_console_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_029 = yamldecode(file("${path.module}/../models/aci_console_authentication.yml"))["aci_console_authentication"]
}

resource "aci_console_authentication" "n029" {
  annotation     = local.m_029["annotation"]
  description    = local.m_029["description"]
  name_alias     = local.m_029["name_alias"]
  provider_group = local.m_029["provider_group"]
  realm          = local.m_029["realm"]
  realm_sub_type = local.m_029["realm_sub_type"]
}
