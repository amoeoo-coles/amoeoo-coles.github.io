# 426 · resource aci_relation_from_any_to_provider_contract · 3. Tenant and networking
# Manages ACI Relation From Any To Provider Contract
# APIC class: vzRsAnyToProv · DN: uni/tn-{name}/ctx-{name}/any/rsanyToProv-{tnVzBrCPName}
# Reads models/aci_relation_from_any_to_provider_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_426 = yamldecode(file("${path.module}/../models/aci_relation_from_any_to_provider_contract.yml"))["aci_relation_from_any_to_provider_contract"]
}

resource "aci_relation_from_any_to_provider_contract" "n426" {
  annotation     = local.m_426["annotation"]
  annotations    = local.m_426["annotations"]
  contract_name  = local.m_426["contract_name"]
  match_criteria = local.m_426["match_criteria"]
  parent_dn      = local.m_426["parent_dn"]
  priority       = local.m_426["priority"]
  tags           = local.m_426["tags"]
}
