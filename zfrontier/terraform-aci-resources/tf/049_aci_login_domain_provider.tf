# 049 · resource aci_login_domain_provider · 1. System and fabric setup
# Manages ACI Login Domain Provider
# APIC class: not collected · DN: not collected
# Reads models/aci_login_domain_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/aci_login_domain_provider.yml"))["aci_login_domain_provider"]
}

resource "aci_login_domain_provider" "n049" {
  annotation  = local.m_049["annotation"]
  description = local.m_049["description"]
  name        = local.m_049["name"]
  name_alias  = local.m_049["name_alias"]
  order       = local.m_049["order"]
  parent_dn   = local.m_049["parent_dn"]
}
