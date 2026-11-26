# 025 · resource aci_aaa_domain · 1. System and fabric setup
# Manages ACI aaa Domain
# APIC class: not collected · DN: not collected
# Reads models/aci_aaa_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_025 = yamldecode(file("${path.module}/../models/aci_aaa_domain.yml"))["aci_aaa_domain"]
}

resource "aci_aaa_domain" "n025" {
  annotation  = local.m_025["annotation"]
  description = local.m_025["description"]
  name        = local.m_025["name"]
  name_alias  = local.m_025["name_alias"]
}
