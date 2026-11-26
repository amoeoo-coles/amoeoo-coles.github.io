# 535 · data source aci_relation_to_domain · 4. Application
# Data source for ACI Relation To Domain
# APIC class: fvRsDomAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsdomAtt-[{tDn}]
# Reads models/data_aci_relation_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_535 = yamldecode(file("${path.module}/../models/data_aci_relation_to_domain.yml"))["data_aci_relation_to_domain"]
}

data "aci_relation_to_domain" "n535" {
  parent_dn = local.m_535["parent_dn"]
  target_dn = local.m_535["target_dn"]
}

output "n535_data_aci_relation_to_domain_id" {
  value = data.aci_relation_to_domain.n535.id
}
