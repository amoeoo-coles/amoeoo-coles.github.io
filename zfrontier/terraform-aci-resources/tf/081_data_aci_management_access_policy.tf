# 081 · data source aci_management_access_policy · 1. System and fabric setup
# Data source for ACI Management Access Policy
# APIC class: commPol · DN: uni/fabric/comm-{name}
# Reads models/data_aci_management_access_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/data_aci_management_access_policy.yml"))["data_aci_management_access_policy"]
}

data "aci_management_access_policy" "n081" {
  name = local.m_081["name"]
}

output "n081_data_aci_management_access_policy_id" {
  value = data.aci_management_access_policy.n081.id
}
