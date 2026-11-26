# 385 · resource aci_relation_to_netflow_exporter · 3. Tenant and networking
# Manages ACI Relation To NetFlow Exporter
# APIC class: netflowRsMonitorToExporter · DN: uni/infra/monitorpol-{name}/rsmonitorToExporter-{tnNetflowExporterPolName} | uni/tn-{name}/monitorpol-{name}/rsmonitorToExporter-{tnNetflowExporterPolName}
# Reads models/aci_relation_to_netflow_exporter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_385 = yamldecode(file("${path.module}/../models/aci_relation_to_netflow_exporter.yml"))["aci_relation_to_netflow_exporter"]
}

resource "aci_relation_to_netflow_exporter" "n385" {
  annotation                   = local.m_385["annotation"]
  annotations                  = local.m_385["annotations"]
  netflow_exporter_policy_name = local.m_385["netflow_exporter_policy_name"]
  parent_dn                    = local.m_385["parent_dn"]
  tags                         = local.m_385["tags"]
}
