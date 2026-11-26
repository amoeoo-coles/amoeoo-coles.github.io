# 530 · resource aci_relation_to_consumed_contract · 4. Application
# Manages ACI Relation To Consumed Contract
# APIC class: fvRsCons · DN: not collected
# Reads models/aci_relation_to_consumed_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_530 = yamldecode(file("${path.module}/../models/aci_relation_to_consumed_contract.yml"))["aci_relation_to_consumed_contract"]
}

resource "aci_relation_to_consumed_contract" "n530" {
  annotation    = local.m_530["annotation"]
  annotations   = local.m_530["annotations"]
  contract_name = local.m_530["contract_name"]
  parent_dn     = local.m_530["parent_dn"]
  priority      = local.m_530["priority"]
  tags          = local.m_530["tags"]
}
