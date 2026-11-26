# 154 · data source mso_fabric_policies_interface_setting · 11. Fabric policy and resource templates
# Data source for Interface Settings on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_interface_setting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_154 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_interface_setting.yml"))["data_mso_fabric_policies_interface_setting"]
}

data "mso_fabric_policies_interface_setting" "n154" {
  name        = local.m_154["name"]
  template_id = local.m_154["template_id"]
}

output "n154_data_mso_fabric_policies_interface_setting_id" {
  value = data.mso_fabric_policies_interface_setting.n154.id
}
