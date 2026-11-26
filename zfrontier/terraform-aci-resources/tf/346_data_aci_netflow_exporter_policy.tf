# 346 · data source aci_netflow_exporter_policy · 3. Tenant and networking
# Data source for ACI NetFlow Exporter Policy
# APIC class: netflowExporterPol · DN: uni/infra/exporterpol-{name} | uni/tn-{name}/exporterpol-{name}
# Reads models/data_aci_netflow_exporter_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_346 = yamldecode(file("${path.module}/../models/data_aci_netflow_exporter_policy.yml"))["data_aci_netflow_exporter_policy"]
}

data "aci_netflow_exporter_policy" "n346" {
  name      = local.m_346["name"]
  parent_dn = local.m_346["parent_dn"]
}

output "n346_data_aci_netflow_exporter_policy_id" {
  value = data.aci_netflow_exporter_policy.n346.id
}
