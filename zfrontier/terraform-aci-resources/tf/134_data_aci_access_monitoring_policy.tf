# 134 · data source aci_access_monitoring_policy · 2. Access policies
# Data source for ACI Access Monitoring Policy
# APIC class: monInfraPol · DN: uni/infra/moninfra-{name}
# Reads models/data_aci_access_monitoring_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_134 = yamldecode(file("${path.module}/../models/data_aci_access_monitoring_policy.yml"))["data_aci_access_monitoring_policy"]
}

data "aci_access_monitoring_policy" "n134" {
  name = local.m_134["name"]
}

output "n134_data_aci_access_monitoring_policy_id" {
  value = data.aci_access_monitoring_policy.n134.id
}
