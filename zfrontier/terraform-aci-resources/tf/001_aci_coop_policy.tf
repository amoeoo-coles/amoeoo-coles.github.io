# 001 · resource aci_coop_policy · 1. System and fabric setup
# Manages ACI COOP Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_coop_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/aci_coop_policy.yml"))["aci_coop_policy"]
}

resource "aci_coop_policy" "n001" {
  annotation  = local.m_001["annotation"]
  description = local.m_001["description"]
  name_alias  = local.m_001["name_alias"]
  type        = local.m_001["type"]
}
