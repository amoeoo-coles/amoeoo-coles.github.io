# 680 · data source aci_span_source_group · 7. Monitoring and BAU
# Data source for ACI SPAN Source Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_span_source_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_680 = yamldecode(file("${path.module}/../models/data_aci_span_source_group.yml"))["data_aci_span_source_group"]
}

data "aci_span_source_group" "n680" {
  admin_st    = local.m_680["admin_st"]
  annotation  = local.m_680["annotation"]
  description = local.m_680["description"]
  name        = local.m_680["name"]
  name_alias  = local.m_680["name_alias"]
  tenant_dn   = local.m_680["tenant_dn"]
}

output "n680_data_aci_span_source_group_id" {
  value = data.aci_span_source_group.n680.id
}
