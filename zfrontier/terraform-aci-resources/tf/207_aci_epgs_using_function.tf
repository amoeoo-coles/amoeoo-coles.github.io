# 207 · resource aci_epgs_using_function · 2. Access policies
# Manages ACI EPGs Using Function
# APIC class: not collected · DN: not collected
# Reads models/aci_epgs_using_function.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_207 = yamldecode(file("${path.module}/../models/aci_epgs_using_function.yml"))["aci_epgs_using_function"]
}

resource "aci_epgs_using_function" "n207" {
  access_generic_dn = local.m_207["access_generic_dn"]
  annotation        = local.m_207["annotation"]
  encap             = local.m_207["encap"]
  instr_imedcy      = local.m_207["instr_imedcy"]
  mode              = local.m_207["mode"]
  primary_encap     = local.m_207["primary_encap"]
  tdn               = local.m_207["tdn"]
}
