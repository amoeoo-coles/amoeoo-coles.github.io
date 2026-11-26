# 584 · resource aci_relation_from_taboo_contract_subject_to_filter · 4. Application
# Manages ACI Relation From Taboo Contract Subject To Filter
# APIC class: vzRsDenyRule · DN: uni/tn-{name}/taboo-{name}/tsubj-{name}/rsdenyRule-{tnVzFilterName}
# Reads models/aci_relation_from_taboo_contract_subject_to_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_584 = yamldecode(file("${path.module}/../models/aci_relation_from_taboo_contract_subject_to_filter.yml"))["aci_relation_from_taboo_contract_subject_to_filter"]
}

resource "aci_relation_from_taboo_contract_subject_to_filter" "n584" {
  annotation  = local.m_584["annotation"]
  annotations = local.m_584["annotations"]
  directives  = local.m_584["directives"]
  filter_name = local.m_584["filter_name"]
  parent_dn   = local.m_584["parent_dn"]
  tags        = local.m_584["tags"]
}
