# 072 · resource aci_user_security_domain · 1. System and fabric setup
# Manages ACI User Security Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_user_security_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_072 = yamldecode(file("${path.module}/../models/aci_user_security_domain.yml"))["aci_user_security_domain"]
}

resource "aci_user_security_domain" "n072" {
  annotation    = local.m_072["annotation"]
  description   = local.m_072["description"]
  local_user_dn = local.m_072["local_user_dn"]
  name          = local.m_072["name"]
  name_alias    = local.m_072["name_alias"]
}
