# 096 · resource aci_relation_to_consumed_out_of_band_contract · 1. System and fabric setup
# Manages ACI Relation To Consumed Out Of Band Contract
# APIC class: mgmtRsOoBCons · DN: uni/tn-{name}/extmgmt-{name}/instp-{name}/rsooBCons-{tnVzOOBBrCPName}
# Reads models/aci_relation_to_consumed_out_of_band_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/aci_relation_to_consumed_out_of_band_contract.yml"))["aci_relation_to_consumed_out_of_band_contract"]
}

resource "aci_relation_to_consumed_out_of_band_contract" "n096" {
  annotation                = local.m_096["annotation"]
  annotations               = local.m_096["annotations"]
  out_of_band_contract_name = local.m_096["out_of_band_contract_name"]
  parent_dn                 = local.m_096["parent_dn"]
  priority                  = local.m_096["priority"]
  tags                      = local.m_096["tags"]
}
