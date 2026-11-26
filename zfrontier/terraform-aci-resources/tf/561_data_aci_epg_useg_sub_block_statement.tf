# 561 · data source aci_epg_useg_sub_block_statement · 4. Application
# Data source for ACI EPG uSeg Sub Block Statement
# APIC class: fvSCrtrn · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn/crtrn-{name}
# Reads models/data_aci_epg_useg_sub_block_statement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_561 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_sub_block_statement.yml"))["data_aci_epg_useg_sub_block_statement"]
}

data "aci_epg_useg_sub_block_statement" "n561" {
  name      = local.m_561["name"]
  parent_dn = local.m_561["parent_dn"]
}

output "n561_data_aci_epg_useg_sub_block_statement_id" {
  value = data.aci_epg_useg_sub_block_statement.n561.id
}
