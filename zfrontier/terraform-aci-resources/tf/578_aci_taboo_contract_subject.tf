# 578 · resource aci_taboo_contract_subject · 4. Application
# Manages ACI Taboo Contract Subject
# APIC class: vzTSubj · DN: uni/tn-{name}/taboo-{name}/tsubj-{name}
# Reads models/aci_taboo_contract_subject.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_578 = yamldecode(file("${path.module}/../models/aci_taboo_contract_subject.yml"))["aci_taboo_contract_subject"]
}

resource "aci_taboo_contract_subject" "n578" {
  annotation          = local.m_578["annotation"]
  annotations         = local.m_578["annotations"]
  description         = local.m_578["description"]
  name                = local.m_578["name"]
  name_alias          = local.m_578["name_alias"]
  parent_dn           = local.m_578["parent_dn"]
  relation_to_filters = local.m_578["relation_to_filters"]
  tags                = local.m_578["tags"]
}
