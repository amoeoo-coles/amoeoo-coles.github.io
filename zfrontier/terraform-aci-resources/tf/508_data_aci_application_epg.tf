# 508 · data source aci_application_epg · 4. Application
# Data source for ACI Application EPG
# APIC class: fvAEPg · DN: uni/tn-{name}/ap-{name}/epg-{name}
# Reads models/data_aci_application_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_508 = yamldecode(file("${path.module}/../models/data_aci_application_epg.yml"))["data_aci_application_epg"]
}

data "aci_application_epg" "n508" {
  name      = local.m_508["name"]
  parent_dn = local.m_508["parent_dn"]
  dynamic "relation_fv_rs_node_att" {
    for_each = local.m_508["relation_fv_rs_node_att"] == null ? [] : local.m_508["relation_fv_rs_node_att"]
    content {
    }
  }
}

output "n508_data_aci_application_epg_id" {
  value = data.aci_application_epg.n508.id
}
