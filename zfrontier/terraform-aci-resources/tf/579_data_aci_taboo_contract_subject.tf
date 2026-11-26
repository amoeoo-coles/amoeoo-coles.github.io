# 579 · data source aci_taboo_contract_subject · 4. Application
# Data source for ACI Taboo Contract Subject
# APIC class: vzTSubj · DN: uni/tn-{name}/taboo-{name}/tsubj-{name}
# Reads models/data_aci_taboo_contract_subject.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_579 = yamldecode(file("${path.module}/../models/data_aci_taboo_contract_subject.yml"))["data_aci_taboo_contract_subject"]
}

data "aci_taboo_contract_subject" "n579" {
  name      = local.m_579["name"]
  parent_dn = local.m_579["parent_dn"]
}

output "n579_data_aci_taboo_contract_subject_id" {
  value = data.aci_taboo_contract_subject.n579.id
}
