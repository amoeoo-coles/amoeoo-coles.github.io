# 047 · resource aci_login_domain · 1. System and fabric setup
# Manages ACI Login Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_login_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_047 = yamldecode(file("${path.module}/../models/aci_login_domain.yml"))["aci_login_domain"]
}

resource "aci_login_domain" "n047" {
  annotation     = local.m_047["annotation"]
  description    = local.m_047["description"]
  name           = local.m_047["name"]
  name_alias     = local.m_047["name_alias"]
  provider_group = local.m_047["provider_group"]
  realm          = local.m_047["realm"]
  realm_sub_type = local.m_047["realm_sub_type"]
}
