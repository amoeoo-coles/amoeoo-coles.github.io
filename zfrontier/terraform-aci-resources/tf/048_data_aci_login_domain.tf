# 048 · data source aci_login_domain · 1. System and fabric setup
# Data source for ACI Login Domain
# APIC class: not collected · DN: not collected
# Reads models/data_aci_login_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_048 = yamldecode(file("${path.module}/../models/data_aci_login_domain.yml"))["data_aci_login_domain"]
}

data "aci_login_domain" "n048" {
  annotation     = local.m_048["annotation"]
  description    = local.m_048["description"]
  name           = local.m_048["name"]
  name_alias     = local.m_048["name_alias"]
  provider_group = local.m_048["provider_group"]
  realm          = local.m_048["realm"]
  realm_sub_type = local.m_048["realm_sub_type"]
}

output "n048_data_aci_login_domain_id" {
  value = data.aci_login_domain.n048.id
}
