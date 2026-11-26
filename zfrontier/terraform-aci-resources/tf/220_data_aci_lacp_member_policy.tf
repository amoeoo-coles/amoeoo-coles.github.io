# 220 · data source aci_lacp_member_policy · 2. Access policies
# Data source for ACI LACP Member Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_lacp_member_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_220 = yamldecode(file("${path.module}/../models/data_aci_lacp_member_policy.yml"))["data_aci_lacp_member_policy"]
}

data "aci_lacp_member_policy" "n220" {
  annotation    = local.m_220["annotation"]
  description   = local.m_220["description"]
  name          = local.m_220["name"]
  name_alias    = local.m_220["name_alias"]
  priority      = local.m_220["priority"]
  transmit_rate = local.m_220["transmit_rate"]
}

output "n220_data_aci_lacp_member_policy_id" {
  value = data.aci_lacp_member_policy.n220.id
}
