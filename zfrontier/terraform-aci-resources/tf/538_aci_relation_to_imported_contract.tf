# 538 · resource aci_relation_to_imported_contract · 4. Application
# Manages ACI Relation To Imported Contract
# APIC class: fvRsConsIf · DN: not collected
# Reads models/aci_relation_to_imported_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_538 = yamldecode(file("${path.module}/../models/aci_relation_to_imported_contract.yml"))["aci_relation_to_imported_contract"]
}

resource "aci_relation_to_imported_contract" "n538" {
  annotation             = local.m_538["annotation"]
  annotations            = local.m_538["annotations"]
  imported_contract_name = local.m_538["imported_contract_name"]
  parent_dn              = local.m_538["parent_dn"]
  priority               = local.m_538["priority"]
  tags                   = local.m_538["tags"]
}
