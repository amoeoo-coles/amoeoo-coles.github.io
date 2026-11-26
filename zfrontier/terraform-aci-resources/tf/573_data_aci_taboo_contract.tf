# 573 · data source aci_taboo_contract · 4. Application
# Data source for ACI Taboo Contract
# APIC class: vzTaboo · DN: uni/tn-{name}/taboo-{name}
# Reads models/data_aci_taboo_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_573 = yamldecode(file("${path.module}/../models/data_aci_taboo_contract.yml"))["data_aci_taboo_contract"]
}

data "aci_taboo_contract" "n573" {
  name      = local.m_573["name"]
  parent_dn = local.m_573["parent_dn"]
}

output "n573_data_aci_taboo_contract_id" {
  value = data.aci_taboo_contract.n573.id
}
