# 118 · data source catalystcenter_extranet_policy · 7. SD-Access
# This data source can read the Extranet Policy.
# Reads models/data_catalystcenter_extranet_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_118 = yamldecode(file("${path.module}/../models/data_catalystcenter_extranet_policy.yml"))["data_catalystcenter_extranet_policy"]
}

data "catalystcenter_extranet_policy" "n118" {
  extranet_policy_name = local.m_118["extranet_policy_name"]
}

output "n118_data_catalystcenter_extranet_policy_id" {
  value = data.catalystcenter_extranet_policy.n118.id
}
