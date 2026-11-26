# 350 · data source aci_netflow_record_policy · 3. Tenant and networking
# Data source for ACI NetFlow Record Policy
# APIC class: netflowRecordPol · DN: uni/infra/recordpol-{name} | uni/tn-{name}/recordpol-{name}
# Reads models/data_aci_netflow_record_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_350 = yamldecode(file("${path.module}/../models/data_aci_netflow_record_policy.yml"))["data_aci_netflow_record_policy"]
}

data "aci_netflow_record_policy" "n350" {
  name      = local.m_350["name"]
  parent_dn = local.m_350["parent_dn"]
}

output "n350_data_aci_netflow_record_policy_id" {
  value = data.aci_netflow_record_policy.n350.id
}
