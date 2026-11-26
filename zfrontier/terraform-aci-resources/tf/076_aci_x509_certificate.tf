# 076 · resource aci_x509_certificate · 1. System and fabric setup
# Manages ACI X509 Certificate
# APIC class: not collected · DN: not collected
# Reads models/aci_x509_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_076 = yamldecode(file("${path.module}/../models/aci_x509_certificate.yml"))["aci_x509_certificate"]
}

resource "aci_x509_certificate" "n076" {
  annotation    = local.m_076["annotation"]
  data          = local.m_076["data"]
  description   = local.m_076["description"]
  local_user_dn = local.m_076["local_user_dn"]
  name          = local.m_076["name"]
  name_alias    = local.m_076["name_alias"]
}
