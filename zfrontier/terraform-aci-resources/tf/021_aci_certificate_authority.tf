# 021 · resource aci_certificate_authority · 1. System and fabric setup
# Manages ACI Certificate Authority
# APIC class: pkiTP · DN: uni/tn-{name}/certstore/tp-{name} | uni/userext/pkiext/tp-{name}
# Reads models/aci_certificate_authority.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/aci_certificate_authority.yml"))["aci_certificate_authority"]
}

resource "aci_certificate_authority" "n021" {
  annotation        = local.m_021["annotation"]
  annotations       = local.m_021["annotations"]
  certificate_chain = local.m_021["certificate_chain"]
  certificate_usage = local.m_021["certificate_usage"]
  description       = local.m_021["description"]
  name              = local.m_021["name"]
  name_alias        = local.m_021["name_alias"]
  owner_key         = local.m_021["owner_key"]
  owner_tag         = local.m_021["owner_tag"]
  parent_dn         = local.m_021["parent_dn"]
  tags              = local.m_021["tags"]
}
