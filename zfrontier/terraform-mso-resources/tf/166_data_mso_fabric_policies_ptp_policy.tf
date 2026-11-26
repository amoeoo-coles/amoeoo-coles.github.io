# 166 · data source mso_fabric_policies_ptp_policy · 11. Fabric policy and resource templates
# Data source for the PTP Policy on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_ptp_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_166 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_ptp_policy.yml"))["data_mso_fabric_policies_ptp_policy"]
}

data "mso_fabric_policies_ptp_policy" "n166" {
  name        = local.m_166["name"]
  template_id = local.m_166["template_id"]
}

output "n166_data_mso_fabric_policies_ptp_policy_id" {
  value = data.mso_fabric_policies_ptp_policy.n166.id
}
