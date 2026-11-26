# 022 · data source aci_certificate_authority · 1. System and fabric setup
# Data source for ACI Certificate Authority
# APIC class: pkiTP · DN: uni/tn-{name}/certstore/tp-{name} | uni/userext/pkiext/tp-{name}
# Reads models/data_aci_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/data_aci_certificate_authority.yml"))["data_aci_certificate_authority"]
}

data "aci_certificate_authority" "n022" {
  name      = local.m_022["name"]
  parent_dn = local.m_022["parent_dn"]
}

output "n022_data_aci_certificate_authority_id" {
  value = data.aci_certificate_authority.n022.id
}
