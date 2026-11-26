# 077 · data source aci_x509_certificate · 1. System and fabric setup
# Data source for ACI X509 Certificate
# APIC class: not collected · DN: not collected
# Reads models/data_aci_x509_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_077 = yamldecode(file("${path.module}/../models/data_aci_x509_certificate.yml"))["data_aci_x509_certificate"]
}

data "aci_x509_certificate" "n077" {
  annotation    = local.m_077["annotation"]
  data          = local.m_077["data"]
  description   = local.m_077["description"]
  local_user_dn = local.m_077["local_user_dn"]
  name          = local.m_077["name"]
  name_alias    = local.m_077["name_alias"]
}

output "n077_data_aci_x509_certificate_id" {
  value = data.aci_x509_certificate.n077.id
}
