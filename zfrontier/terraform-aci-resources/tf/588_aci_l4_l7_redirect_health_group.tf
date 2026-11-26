# 588 · resource aci_l4_l7_redirect_health_group · 5. L4-L7 service graphs
# Manages ACI L4-L7 Redirect Health Group
# APIC class: not collected · DN: not collected
# Reads models/aci_l4_l7_redirect_health_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_588 = yamldecode(file("${path.module}/../models/aci_l4_l7_redirect_health_group.yml"))["aci_l4_l7_redirect_health_group"]
}

resource "aci_l4_l7_redirect_health_group" "n588" {
  annotation  = local.m_588["annotation"]
  description = local.m_588["description"]
  name        = local.m_588["name"]
  name_alias  = local.m_588["name_alias"]
  tenant_dn   = local.m_588["tenant_dn"]
}
