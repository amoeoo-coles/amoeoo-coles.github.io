# 146 · data source aci_fex_profile · 2. Access policies
# Data source for ACI FEX Profile
# APIC class: infraFexP · DN: uni/infra/fexprof-{name}
# Reads models/data_aci_fex_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_146 = yamldecode(file("${path.module}/../models/data_aci_fex_profile.yml"))["data_aci_fex_profile"]
}

data "aci_fex_profile" "n146" {
  name = local.m_146["name"]
}

output "n146_data_aci_fex_profile_id" {
  value = data.aci_fex_profile.n146.id
}
