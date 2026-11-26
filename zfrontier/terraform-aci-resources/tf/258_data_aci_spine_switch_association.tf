# 258 · data source aci_spine_switch_association · 2. Access policies
# Data source for ACI Spine Switch Association
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_switch_association.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_258 = yamldecode(file("${path.module}/../models/data_aci_spine_switch_association.yml"))["data_aci_spine_switch_association"]
}

data "aci_spine_switch_association" "n258" {
  annotation                    = local.m_258["annotation"]
  description                   = local.m_258["description"]
  name                          = local.m_258["name"]
  name_alias                    = local.m_258["name_alias"]
  spine_profile_dn              = local.m_258["spine_profile_dn"]
  spine_switch_association_type = local.m_258["spine_switch_association_type"]
}

output "n258_data_aci_spine_switch_association_id" {
  value = data.aci_spine_switch_association.n258.id
}
