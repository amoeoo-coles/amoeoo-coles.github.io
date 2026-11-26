# 050 · data source aci_login_domain_provider · 1. System and fabric setup
# Data source for ACI Login Domain Provider
# APIC class: not collected · DN: not collected
# Reads models/data_aci_login_domain_provider.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/data_aci_login_domain_provider.yml"))["data_aci_login_domain_provider"]
}

data "aci_login_domain_provider" "n050" {
  annotation  = local.m_050["annotation"]
  description = local.m_050["description"]
  name        = local.m_050["name"]
  name_alias  = local.m_050["name_alias"]
  order       = local.m_050["order"]
  parent_dn   = local.m_050["parent_dn"]
}

output "n050_data_aci_login_domain_provider_id" {
  value = data.aci_login_domain_provider.n050.id
}
