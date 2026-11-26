# 341 · resource aci_monitoring_policy · 3. Tenant and networking
# Manages ACI Monitoring Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_341 = yamldecode(file("${path.module}/../models/aci_monitoring_policy.yml"))["aci_monitoring_policy"]
}

resource "aci_monitoring_policy" "n341" {
  annotation  = local.m_341["annotation"]
  description = local.m_341["description"]
  name        = local.m_341["name"]
  name_alias  = local.m_341["name_alias"]
  tenant_dn   = local.m_341["tenant_dn"]
}
