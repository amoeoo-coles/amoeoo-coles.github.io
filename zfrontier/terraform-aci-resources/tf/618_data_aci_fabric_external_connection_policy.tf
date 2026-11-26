# 618 · data source aci_fabric_external_connection_policy · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Fabric External Connection Policy
# APIC class: fvFabricExtConnP · DN: uni/tn-{name}/fabricExtConnP-{id}
# Reads models/data_aci_fabric_external_connection_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_618 = yamldecode(file("${path.module}/../models/data_aci_fabric_external_connection_policy.yml"))["data_aci_fabric_external_connection_policy"]
}

data "aci_fabric_external_connection_policy" "n618" {
  fabric_id = local.m_618["fabric_id"]
  parent_dn = local.m_618["parent_dn"]
}

output "n618_data_aci_fabric_external_connection_policy_id" {
  value = data.aci_fabric_external_connection_policy.n618.id
}
