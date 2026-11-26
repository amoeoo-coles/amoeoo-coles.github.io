# 386 · data source aci_relation_to_netflow_exporter · 3. Tenant and networking
# Data source for ACI Relation To NetFlow Exporter
# APIC class: netflowRsMonitorToExporter · DN: uni/infra/monitorpol-{name}/rsmonitorToExporter-{tnNetflowExporterPolName} | uni/tn-{name}/monitorpol-{name}/rsmonitorToExporter-{tnNetflowExporterPolName}
# Reads models/data_aci_relation_to_netflow_exporter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_386 = yamldecode(file("${path.module}/../models/data_aci_relation_to_netflow_exporter.yml"))["data_aci_relation_to_netflow_exporter"]
}

data "aci_relation_to_netflow_exporter" "n386" {
  netflow_exporter_policy_name = local.m_386["netflow_exporter_policy_name"]
  parent_dn                    = local.m_386["parent_dn"]
}

output "n386_data_aci_relation_to_netflow_exporter_id" {
  value = data.aci_relation_to_netflow_exporter.n386.id
}
