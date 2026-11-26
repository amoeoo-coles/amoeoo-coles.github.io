# 015 · resource aci_mgmt_preference · 1. System and fabric setup
# Manages ACI Mgmt Preference
# APIC class: not collected · DN: not collected
# Reads models/aci_mgmt_preference.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/aci_mgmt_preference.yml"))["aci_mgmt_preference"]
}

resource "aci_mgmt_preference" "n015" {
  annotation     = local.m_015["annotation"]
  description    = local.m_015["description"]
  interface_pref = local.m_015["interface_pref"]
  name_alias     = local.m_015["name_alias"]
}
