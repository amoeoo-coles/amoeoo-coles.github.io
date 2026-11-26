# 026 · data source aci_aaa_domain · 1. System and fabric setup
# Data source for ACI aaa Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_aaa_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/data_aci_aaa_domain.yml"))["data_aci_aaa_domain"]
}

data "aci_aaa_domain" "n026" {
  annotation  = local.m_026["annotation"]
  description = local.m_026["description"]
  name        = local.m_026["name"]
  name_alias  = local.m_026["name_alias"]
}

output "n026_data_aci_aaa_domain_id" {
  value = data.aci_aaa_domain.n026.id
}
