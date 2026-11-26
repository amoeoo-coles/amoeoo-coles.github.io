# 342 · data source aci_monitoring_policy · 3. Tenant and networking
# Data source for ACI Monitoring Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_342 = yamldecode(file("${path.module}/../models/data_aci_monitoring_policy.yml"))["data_aci_monitoring_policy"]
}

data "aci_monitoring_policy" "n342" {
  annotation  = local.m_342["annotation"]
  description = local.m_342["description"]
  name        = local.m_342["name"]
  name_alias  = local.m_342["name_alias"]
  tenant_dn   = local.m_342["tenant_dn"]
}

output "n342_data_aci_monitoring_policy_id" {
  value = data.aci_monitoring_policy.n342.id
}
