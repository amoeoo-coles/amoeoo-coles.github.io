# 007 · resource aci_endpoint_ip_aging_profile · 1. System and fabric setup
# Manages ACI Endpoint IP Aging Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_ip_aging_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/aci_endpoint_ip_aging_profile.yml"))["aci_endpoint_ip_aging_profile"]
}

resource "aci_endpoint_ip_aging_profile" "n007" {
  admin_st    = local.m_007["admin_st"]
  annotation  = local.m_007["annotation"]
  description = local.m_007["description"]
  name_alias  = local.m_007["name_alias"]
}
