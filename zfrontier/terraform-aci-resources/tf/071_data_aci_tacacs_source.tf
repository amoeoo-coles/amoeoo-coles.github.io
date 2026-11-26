# 071 · data source aci_tacacs_source · 1. System and fabric setup
# Data source for ACI TACACS Source
# APIC class: not collected · DN: not collected
# Reads models/data_aci_tacacs_source.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_071 = yamldecode(file("${path.module}/../models/data_aci_tacacs_source.yml"))["data_aci_tacacs_source"]
}

data "aci_tacacs_source" "n071" {
  annotation  = local.m_071["annotation"]
  description = local.m_071["description"]
  incl        = local.m_071["incl"]
  min_sev     = local.m_071["min_sev"]
  name        = local.m_071["name"]
  name_alias  = local.m_071["name_alias"]
  parent_dn   = local.m_071["parent_dn"]
}

output "n071_data_aci_tacacs_source_id" {
  value = data.aci_tacacs_source.n071.id
}
