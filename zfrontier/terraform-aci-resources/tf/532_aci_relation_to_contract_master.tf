# 532 · resource aci_relation_to_contract_master · 4. Application
# Manages ACI Relation To Contract Master
# APIC class: fvRsSecInherited · DN: not collected
# Reads models/aci_relation_to_contract_master.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_532 = yamldecode(file("${path.module}/../models/aci_relation_to_contract_master.yml"))["aci_relation_to_contract_master"]
}

resource "aci_relation_to_contract_master" "n532" {
  annotation  = local.m_532["annotation"]
  annotations = local.m_532["annotations"]
  parent_dn   = local.m_532["parent_dn"]
  tags        = local.m_532["tags"]
  target_dn   = local.m_532["target_dn"]
}
