# 256 · data source aci_spine_profile · 2. Access policies
# Data source for ACI Spine Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_256 = yamldecode(file("${path.module}/../models/data_aci_spine_profile.yml"))["data_aci_spine_profile"]
}

data "aci_spine_profile" "n256" {
  annotation  = local.m_256["annotation"]
  description = local.m_256["description"]
  name        = local.m_256["name"]
  name_alias  = local.m_256["name_alias"]
}

output "n256_data_aci_spine_profile_id" {
  value = data.aci_spine_profile.n256.id
}
