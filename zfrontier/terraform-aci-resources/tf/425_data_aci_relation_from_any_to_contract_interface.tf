# 425 · data source aci_relation_from_any_to_contract_interface · 3. Tenant and networking
# Data source for ACI Relation From Any To Contract Interface
# APIC class: vzRsAnyToConsIf · DN: uni/tn-{name}/ctx-{name}/any/rsanyToConsIf-{tnVzCPIfName}
# Reads models/data_aci_relation_from_any_to_contract_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_425 = yamldecode(file("${path.module}/../models/data_aci_relation_from_any_to_contract_interface.yml"))["data_aci_relation_from_any_to_contract_interface"]
}

data "aci_relation_from_any_to_contract_interface" "n425" {
  imported_contract_name = local.m_425["imported_contract_name"]
  parent_dn              = local.m_425["parent_dn"]
}

output "n425_data_aci_relation_from_any_to_contract_interface_id" {
  value = data.aci_relation_from_any_to_contract_interface.n425.id
}
