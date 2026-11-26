# 062 · resource aci_tacacs_accounting · 1. System and fabric setup
# Manages ACI TACACS Accounting
# APIC class: not collected · DN: not collected
# Reads models/aci_tacacs_accounting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_062 = yamldecode(file("${path.module}/../models/aci_tacacs_accounting.yml"))["aci_tacacs_accounting"]
}

resource "aci_tacacs_accounting" "n062" {
  annotation  = local.m_062["annotation"]
  description = local.m_062["description"]
  name        = local.m_062["name"]
  name_alias  = local.m_062["name_alias"]
}
