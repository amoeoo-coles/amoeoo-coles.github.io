# 524 · resource aci_epg_to_static_path · 4. Application
# Manages ACI EPG to Static Path
# APIC class: not collected · DN: not collected
# Reads models/aci_epg_to_static_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_524 = yamldecode(file("${path.module}/../models/aci_epg_to_static_path.yml"))["aci_epg_to_static_path"]
}

resource "aci_epg_to_static_path" "n524" {
  annotation         = local.m_524["annotation"]
  application_epg_dn = local.m_524["application_epg_dn"]
  description        = local.m_524["description"]
  encap              = local.m_524["encap"]
  instr_imedcy       = local.m_524["instr_imedcy"]
  mode               = local.m_524["mode"]
  primary_encap      = local.m_524["primary_encap"]
  tdn                = local.m_524["tdn"]
}
