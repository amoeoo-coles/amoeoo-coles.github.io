# 164 · data source mso_fabric_policies_physical_domain · 11. Fabric policy and resource templates
# Data source for Physical Domains on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_physical_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_164 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_physical_domain.yml"))["data_mso_fabric_policies_physical_domain"]
}

data "mso_fabric_policies_physical_domain" "n164" {
  name        = local.m_164["name"]
  template_id = local.m_164["template_id"]
}

output "n164_data_mso_fabric_policies_physical_domain_id" {
  value = data.mso_fabric_policies_physical_domain.n164.id
}
