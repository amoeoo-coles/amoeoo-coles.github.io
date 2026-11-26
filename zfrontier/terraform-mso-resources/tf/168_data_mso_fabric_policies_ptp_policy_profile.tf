# 168 · data source mso_fabric_policies_ptp_policy_profile · 11. Fabric policy and resource templates
# Data source for PTP Profiles on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_ptp_policy_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_168 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_ptp_policy_profile.yml"))["data_mso_fabric_policies_ptp_policy_profile"]
}

data "mso_fabric_policies_ptp_policy_profile" "n168" {
  name        = local.m_168["name"]
  template_id = local.m_168["template_id"]
}

output "n168_data_mso_fabric_policies_ptp_policy_profile_id" {
  value = data.mso_fabric_policies_ptp_policy_profile.n168.id
}
