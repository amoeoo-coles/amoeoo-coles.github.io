# 337 · resource aci_match_rule · 3. Tenant and networking
# Manages ACI Match Rule
# APIC class: not collected · DN: not collected
# Reads models/aci_match_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_337 = yamldecode(file("${path.module}/../models/aci_match_rule.yml"))["aci_match_rule"]
}

resource "aci_match_rule" "n337" {
  annotation  = local.m_337["annotation"]
  description = local.m_337["description"]
  name        = local.m_337["name"]
  name_alias  = local.m_337["name_alias"]
  tenant_dn   = local.m_337["tenant_dn"]
}
