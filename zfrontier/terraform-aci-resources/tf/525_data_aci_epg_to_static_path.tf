# 525 · data source aci_epg_to_static_path · 4. Application
# Data source for ACI EPG to Static Path
# APIC class: not collected · DN: not collected
# Reads models/data_aci_epg_to_static_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_525 = yamldecode(file("${path.module}/../models/data_aci_epg_to_static_path.yml"))["data_aci_epg_to_static_path"]
}

data "aci_epg_to_static_path" "n525" {
  annotation         = local.m_525["annotation"]
  application_epg_dn = local.m_525["application_epg_dn"]
  description        = local.m_525["description"]
  encap              = local.m_525["encap"]
  instr_imedcy       = local.m_525["instr_imedcy"]
  mode               = local.m_525["mode"]
  primary_encap      = local.m_525["primary_encap"]
  tdn                = local.m_525["tdn"]
}

output "n525_data_aci_epg_to_static_path_id" {
  value = data.aci_epg_to_static_path.n525.id
}
