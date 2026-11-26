# 527 · data source aci_epg_useg_block_statement · 4. Application
# Data source for ACI EPG uSeg Block Statement
# APIC class: fvCrtrn · DN: uni/tn-{name}/ap-{name}/epg-{name}/crtrn
# Reads models/data_aci_epg_useg_block_statement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_527 = yamldecode(file("${path.module}/../models/data_aci_epg_useg_block_statement.yml"))["data_aci_epg_useg_block_statement"]
}

data "aci_epg_useg_block_statement" "n527" {
  parent_dn = local.m_527["parent_dn"]
}

output "n527_data_aci_epg_useg_block_statement_id" {
  value = data.aci_epg_useg_block_statement.n527.id
}
