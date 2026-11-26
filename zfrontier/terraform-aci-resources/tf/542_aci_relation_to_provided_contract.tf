# 542 · resource aci_relation_to_provided_contract · 4. Application
# Manages ACI Relation To Provided Contract
# APIC class: fvRsProv · DN: not collected
# Reads models/aci_relation_to_provided_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_542 = yamldecode(file("${path.module}/../models/aci_relation_to_provided_contract.yml"))["aci_relation_to_provided_contract"]
}

resource "aci_relation_to_provided_contract" "n542" {
  annotation     = local.m_542["annotation"]
  annotations    = local.m_542["annotations"]
  contract_name  = local.m_542["contract_name"]
  match_criteria = local.m_542["match_criteria"]
  parent_dn      = local.m_542["parent_dn"]
  priority       = local.m_542["priority"]
  tags           = local.m_542["tags"]
}
