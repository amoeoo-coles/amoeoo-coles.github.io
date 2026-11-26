# 547 · data source aci_relation_to_static_path · 4. Application
# Data source for ACI Relation To Static Path
# APIC class: fvRsPathAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rspathAtt-[{tDn}]
# Reads models/data_aci_relation_to_static_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_547 = yamldecode(file("${path.module}/../models/data_aci_relation_to_static_path.yml"))["data_aci_relation_to_static_path"]
}

data "aci_relation_to_static_path" "n547" {
  parent_dn = local.m_547["parent_dn"]
  target_dn = local.m_547["target_dn"]
}

output "n547_data_aci_relation_to_static_path_id" {
  value = data.aci_relation_to_static_path.n547.id
}
