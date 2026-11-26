# 068 · resource aci_tacacs_provider_group · 1. System and fabric setup
# Manages ACI TACACS + Provider Group
# APIC class: not collected · DN: not collected
# Reads models/aci_tacacs_provider_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/aci_tacacs_provider_group.yml"))["aci_tacacs_provider_group"]
}

resource "aci_tacacs_provider_group" "n068" {
  annotation  = local.m_068["annotation"]
  description = local.m_068["description"]
  name        = local.m_068["name"]
  name_alias  = local.m_068["name_alias"]
}
