# 424 · resource aci_relation_from_any_to_contract_interface · 3. Tenant and networking
# Manages ACI Relation From Any To Contract Interface
# APIC class: vzRsAnyToConsIf · DN: uni/tn-{name}/ctx-{name}/any/rsanyToConsIf-{tnVzCPIfName}
# Reads models/aci_relation_from_any_to_contract_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_424 = yamldecode(file("${path.module}/../models/aci_relation_from_any_to_contract_interface.yml"))["aci_relation_from_any_to_contract_interface"]
}

resource "aci_relation_from_any_to_contract_interface" "n424" {
  annotation             = local.m_424["annotation"]
  annotations            = local.m_424["annotations"]
  imported_contract_name = local.m_424["imported_contract_name"]
  parent_dn              = local.m_424["parent_dn"]
  priority               = local.m_424["priority"]
  tags                   = local.m_424["tags"]
}
