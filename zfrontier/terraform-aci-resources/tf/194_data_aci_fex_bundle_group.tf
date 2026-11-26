# 194 · data source aci_fex_bundle_group · 2. Access policies
# Data source for ACI Fex Bundle Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fex_bundle_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_194 = yamldecode(file("${path.module}/../models/data_aci_fex_bundle_group.yml"))["data_aci_fex_bundle_group"]
}

data "aci_fex_bundle_group" "n194" {
  annotation     = local.m_194["annotation"]
  description    = local.m_194["description"]
  fex_profile_dn = local.m_194["fex_profile_dn"]
  name           = local.m_194["name"]
  name_alias     = local.m_194["name_alias"]
}

output "n194_data_aci_fex_bundle_group_id" {
  value = data.aci_fex_bundle_group.n194.id
}
