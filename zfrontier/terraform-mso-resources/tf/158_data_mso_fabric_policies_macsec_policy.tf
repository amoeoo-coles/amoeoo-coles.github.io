# 158 · data source mso_fabric_policies_macsec_policy · 11. Fabric policy and resource templates
# Data source for MACsec Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_macsec_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_158 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_macsec_policy.yml"))["data_mso_fabric_policies_macsec_policy"]
}

data "mso_fabric_policies_macsec_policy" "n158" {
  name        = local.m_158["name"]
  template_id = local.m_158["template_id"]
}

output "n158_data_mso_fabric_policies_macsec_policy_id" {
  value = data.mso_fabric_policies_macsec_policy.n158.id
}
