# 188 · data source catalystcenter_wireless_rrm_fra_configuration · 8. Wireless
# This data source can read the Wireless RRM FRA Configuration.
# Reads models/data_catalystcenter_wireless_rrm_fra_configuration.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_188 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_rrm_fra_configuration.yml"))["data_catalystcenter_wireless_rrm_fra_configuration"]
}

data "catalystcenter_wireless_rrm_fra_configuration" "n188" {
  id = local.m_188["id"]
}

output "n188_data_catalystcenter_wireless_rrm_fra_configuration_id" {
  value = data.catalystcenter_wireless_rrm_fra_configuration.n188.id
}
