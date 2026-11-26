# 002 · data source aci_coop_policy · 1. System and fabric setup
# Data source for ACI COOP Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_coop_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_aci_coop_policy.yml"))["data_aci_coop_policy"]
}

data "aci_coop_policy" "n002" {
  annotation  = local.m_002["annotation"]
  description = local.m_002["description"]
  name_alias  = local.m_002["name_alias"]
  type        = local.m_002["type"]
}

output "n002_data_aci_coop_policy_id" {
  value = data.aci_coop_policy.n002.id
}
