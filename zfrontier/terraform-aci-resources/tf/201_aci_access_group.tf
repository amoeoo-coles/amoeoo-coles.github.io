# 201 · resource aci_access_group · 2. Access policies
# Manages ACI Access Group
# APIC class: not collected · DN: not collected
# Reads models/aci_access_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_201 = yamldecode(file("${path.module}/../models/aci_access_group.yml"))["aci_access_group"]
}

resource "aci_access_group" "n201" {
  access_port_selector_dn = local.m_201["access_port_selector_dn"]
  annotation              = local.m_201["annotation"]
  fex_id                  = local.m_201["fex_id"]
  tdn                     = local.m_201["tdn"]
}
