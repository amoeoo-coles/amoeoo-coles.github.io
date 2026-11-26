# 061 · data source aci_saml_provider_group · 1. System and fabric setup
# Data source for ACI SAML Provider Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_saml_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/data_aci_saml_provider_group.yml"))["data_aci_saml_provider_group"]
}

data "aci_saml_provider_group" "n061" {
  annotation  = local.m_061["annotation"]
  description = local.m_061["description"]
  name        = local.m_061["name"]
  name_alias  = local.m_061["name_alias"]
}

output "n061_data_aci_saml_provider_group_id" {
  value = data.aci_saml_provider_group.n061.id
}
