# 196 · data source catalystcenter_qos_policy_setting · 9. Application policy
# This data source can read the QoS Policy Setting.
# Reads models/data_catalystcenter_qos_policy_setting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_196 = yamldecode(file("${path.module}/../models/data_catalystcenter_qos_policy_setting.yml"))["data_catalystcenter_qos_policy_setting"]
}

data "catalystcenter_qos_policy_setting" "n196" {
  name = local.m_196["name"]
}

output "n196_data_catalystcenter_qos_policy_setting_id" {
  value = data.catalystcenter_qos_policy_setting.n196.id
}
