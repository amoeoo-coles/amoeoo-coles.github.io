# 678 · data source aci_span_destination_group · 7. Monitoring and BAU
# Data source for ACI SPAN Destination Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_span_destination_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_678 = yamldecode(file("${path.module}/../models/data_aci_span_destination_group.yml"))["data_aci_span_destination_group"]
}

data "aci_span_destination_group" "n678" {
  annotation  = local.m_678["annotation"]
  description = local.m_678["description"]
  name        = local.m_678["name"]
  name_alias  = local.m_678["name_alias"]
  tenant_dn   = local.m_678["tenant_dn"]
}

output "n678_data_aci_span_destination_group_id" {
  value = data.aci_span_destination_group.n678.id
}
