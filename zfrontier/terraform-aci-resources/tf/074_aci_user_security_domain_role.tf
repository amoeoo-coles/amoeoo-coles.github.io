# 074 · resource aci_user_security_domain_role · 1. System and fabric setup
# Manages ACI User Security Domain Role
# APIC class: not collected · DN: not collected
# Reads models/aci_user_security_domain_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_074 = yamldecode(file("${path.module}/../models/aci_user_security_domain_role.yml"))["aci_user_security_domain_role"]
}

resource "aci_user_security_domain_role" "n074" {
  annotation     = local.m_074["annotation"]
  description    = local.m_074["description"]
  name           = local.m_074["name"]
  name_alias     = local.m_074["name_alias"]
  priv_type      = local.m_074["priv_type"]
  user_domain_dn = local.m_074["user_domain_dn"]
}
