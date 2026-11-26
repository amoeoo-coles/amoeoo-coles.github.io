# 422 · resource aci_relation_from_any_to_consumer_contract · 3. Tenant and networking
# Manages ACI Relation From Any To Consumer Contract
# APIC class: vzRsAnyToCons · DN: uni/tn-{name}/ctx-{name}/any/rsanyToCons-{tnVzBrCPName}
# Reads models/aci_relation_from_any_to_consumer_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_422 = yamldecode(file("${path.module}/../models/aci_relation_from_any_to_consumer_contract.yml"))["aci_relation_from_any_to_consumer_contract"]
}

resource "aci_relation_from_any_to_consumer_contract" "n422" {
  annotation    = local.m_422["annotation"]
  annotations   = local.m_422["annotations"]
  contract_name = local.m_422["contract_name"]
  parent_dn     = local.m_422["parent_dn"]
  priority      = local.m_422["priority"]
  tags          = local.m_422["tags"]
}
