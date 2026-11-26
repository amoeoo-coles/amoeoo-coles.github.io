# 368 · data source aci_dscp_to_priority_map · 3. Tenant and networking
# Data source for ACI DSCP to Priority Map
# APIC class: qosDscpClass · DN: uni/tn-{name}/qoscustom-{name}/dcsp-{from}-{to}
# Reads models/data_aci_dscp_to_priority_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_368 = yamldecode(file("${path.module}/../models/data_aci_dscp_to_priority_map.yml"))["data_aci_dscp_to_priority_map"]
}

data "aci_dscp_to_priority_map" "n368" {
  from      = local.m_368["from"]
  parent_dn = local.m_368["parent_dn"]
  to        = local.m_368["to"]
}

output "n368_data_aci_dscp_to_priority_map_id" {
  value = data.aci_dscp_to_priority_map.n368.id
}
