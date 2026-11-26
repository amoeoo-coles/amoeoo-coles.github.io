# 548 · resource aci_relation_to_taboo_contract · 4. Application
# Manages ACI Relation To Taboo Contract
# APIC class: fvRsProtBy · DN: not collected
# Reads models/aci_relation_to_taboo_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_548 = yamldecode(file("${path.module}/../models/aci_relation_to_taboo_contract.yml"))["aci_relation_to_taboo_contract"]
}

resource "aci_relation_to_taboo_contract" "n548" {
  annotation          = local.m_548["annotation"]
  annotations         = local.m_548["annotations"]
  parent_dn           = local.m_548["parent_dn"]
  taboo_contract_name = local.m_548["taboo_contract_name"]
  tags                = local.m_548["tags"]
}
