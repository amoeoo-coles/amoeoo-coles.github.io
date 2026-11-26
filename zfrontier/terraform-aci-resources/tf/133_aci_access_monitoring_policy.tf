# 133 · resource aci_access_monitoring_policy · 2. Access policies
# Manages ACI Access Monitoring Policy
# APIC class: monInfraPol · DN: uni/infra/moninfra-{name}
# Reads models/aci_access_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_133 = yamldecode(file("${path.module}/../models/aci_access_monitoring_policy.yml"))["aci_access_monitoring_policy"]
}

resource "aci_access_monitoring_policy" "n133" {
  annotation  = local.m_133["annotation"]
  annotations = local.m_133["annotations"]
  description = local.m_133["description"]
  name        = local.m_133["name"]
  name_alias  = local.m_133["name_alias"]
  owner_key   = local.m_133["owner_key"]
  owner_tag   = local.m_133["owner_tag"]
  tags        = local.m_133["tags"]
}
