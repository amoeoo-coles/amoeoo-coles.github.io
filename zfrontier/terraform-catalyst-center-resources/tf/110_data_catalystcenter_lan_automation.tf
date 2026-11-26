# 110 · data source catalystcenter_lan_automation · 6. Templates, profiles and LAN automation
# This data source can read the LAN Automation.
# Reads models/data_catalystcenter_lan_automation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/data_catalystcenter_lan_automation.yml"))["data_catalystcenter_lan_automation"]
}

data "catalystcenter_lan_automation" "n110" {
  id = local.m_110["id"]
}

output "n110_data_catalystcenter_lan_automation_id" {
  value = data.catalystcenter_lan_automation.n110.id
}
