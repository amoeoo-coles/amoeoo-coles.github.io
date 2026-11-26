# 006 · data source catalystcenter_external_authentication_aaa_attribute · 1. System
# This data source can read the External Authentication AAA Attribute.
# Reads models/data_catalystcenter_external_authentication_aaa_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_catalystcenter_external_authentication_aaa_attribute.yml"))["data_catalystcenter_external_authentication_aaa_attribute"]
}

data "catalystcenter_external_authentication_aaa_attribute" "n006" {
}

output "n006_data_catalystcenter_external_authentication_aaa_attribute_id" {
  value = data.catalystcenter_external_authentication_aaa_attribute.n006.id
}
