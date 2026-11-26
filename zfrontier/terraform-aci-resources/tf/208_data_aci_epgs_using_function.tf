# 208 · data source aci_epgs_using_function · 2. Access policies
# Data source for ACI EPGs Using Function
# APIC class: not collected · DN: not collected
# Reads models/data_aci_epgs_using_function.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_208 = yamldecode(file("${path.module}/../models/data_aci_epgs_using_function.yml"))["data_aci_epgs_using_function"]
}

data "aci_epgs_using_function" "n208" {
  access_generic_dn = local.m_208["access_generic_dn"]
  annotation        = local.m_208["annotation"]
  description       = local.m_208["description"]
  encap             = local.m_208["encap"]
  instr_imedcy      = local.m_208["instr_imedcy"]
  mode              = local.m_208["mode"]
  primary_encap     = local.m_208["primary_encap"]
  tdn               = local.m_208["tdn"]
}

output "n208_data_aci_epgs_using_function_id" {
  value = data.aci_epgs_using_function.n208.id
}
