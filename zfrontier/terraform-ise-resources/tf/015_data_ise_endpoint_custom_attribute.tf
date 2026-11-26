# 015 · data source ise_endpoint_custom_attribute · 2. Identity management
# This data source can read the Endpoint Custom Attribute.
# Reads models/data_ise_endpoint_custom_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/data_ise_endpoint_custom_attribute.yml"))["data_ise_endpoint_custom_attribute"]
}

data "ise_endpoint_custom_attribute" "n015" {
  id = local.m_015["id"]
}

output "n015_data_ise_endpoint_custom_attribute_id" {
  value = data.ise_endpoint_custom_attribute.n015.id
}
