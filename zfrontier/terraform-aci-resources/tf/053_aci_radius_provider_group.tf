# 053 · resource aci_radius_provider_group · 1. System and fabric setup
# Manages ACI RADIUS Provider Group
# APIC class: not collected · DN: not collected
# Reads models/aci_radius_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_053 = yamldecode(file("${path.module}/../models/aci_radius_provider_group.yml"))["aci_radius_provider_group"]
}

resource "aci_radius_provider_group" "n053" {
  annotation  = local.m_053["annotation"]
  description = local.m_053["description"]
  name        = local.m_053["name"]
  name_alias  = local.m_053["name_alias"]
}
