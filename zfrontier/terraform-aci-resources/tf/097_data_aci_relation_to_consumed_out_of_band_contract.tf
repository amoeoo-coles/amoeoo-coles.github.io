# 097 · data source aci_relation_to_consumed_out_of_band_contract · 1. System and fabric setup
# Data source for ACI Relation To Consumed Out Of Band Contract
# APIC class: mgmtRsOoBCons · DN: uni/tn-{name}/extmgmt-{name}/instp-{name}/rsooBCons-{tnVzOOBBrCPName}
# Reads models/data_aci_relation_to_consumed_out_of_band_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/data_aci_relation_to_consumed_out_of_band_contract.yml"))["data_aci_relation_to_consumed_out_of_band_contract"]
}

data "aci_relation_to_consumed_out_of_band_contract" "n097" {
  out_of_band_contract_name = local.m_097["out_of_band_contract_name"]
  parent_dn                 = local.m_097["parent_dn"]
}

output "n097_data_aci_relation_to_consumed_out_of_band_contract_id" {
  value = data.aci_relation_to_consumed_out_of_band_contract.n097.id
}
