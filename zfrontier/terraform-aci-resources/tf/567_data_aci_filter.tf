# 567 · data source aci_filter · 4. Application
# Data source for ACI Filter
# APIC class: not collected · DN: not collected
# Reads models/data_aci_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_567 = yamldecode(file("${path.module}/../models/data_aci_filter.yml"))["data_aci_filter"]
}

data "aci_filter" "n567" {
  annotation  = local.m_567["annotation"]
  description = local.m_567["description"]
  name        = local.m_567["name"]
  name_alias  = local.m_567["name_alias"]
  tenant_dn   = local.m_567["tenant_dn"]
}

output "n567_data_aci_filter_id" {
  value = data.aci_filter.n567.id
}
