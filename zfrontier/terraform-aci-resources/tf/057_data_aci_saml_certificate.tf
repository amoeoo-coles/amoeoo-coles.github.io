# 057 · data source aci_saml_certificate · 1. System and fabric setup
# Data source for ACI SAML Encryption Certificate
# APIC class: not collected · DN: not collected
# Reads models/data_aci_saml_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/data_aci_saml_certificate.yml"))["data_aci_saml_certificate"]
}

data "aci_saml_certificate" "n057" {
  annotation          = local.m_057["annotation"]
  certificate         = local.m_057["certificate"]
  certificate_validty = local.m_057["certificate_validty"]
  description         = local.m_057["description"]
  expiry_status       = local.m_057["expiry_status"]
  name_alias          = local.m_057["name_alias"]
  regenerate          = local.m_057["regenerate"]
}

output "n057_data_aci_saml_certificate_id" {
  value = data.aci_saml_certificate.n057.id
}
