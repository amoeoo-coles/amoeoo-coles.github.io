# 533 · data source aci_relation_to_contract_master · 4. Application
# Data source for ACI Relation To Contract Master
# APIC class: fvRsSecInherited · DN: not collected
# Reads models/data_aci_relation_to_contract_master.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_533 = yamldecode(file("${path.module}/../models/data_aci_relation_to_contract_master.yml"))["data_aci_relation_to_contract_master"]
}

data "aci_relation_to_contract_master" "n533" {
  parent_dn = local.m_533["parent_dn"]
  target_dn = local.m_533["target_dn"]
}

output "n533_data_aci_relation_to_contract_master_id" {
  value = data.aci_relation_to_contract_master.n533.id
}
