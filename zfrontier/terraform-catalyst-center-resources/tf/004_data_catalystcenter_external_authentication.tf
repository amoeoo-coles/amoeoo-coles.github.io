# 004 · data source catalystcenter_external_authentication · 1. System
# This data source can read the External Authentication.
# Reads models/data_catalystcenter_external_authentication.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/data_catalystcenter_external_authentication.yml"))["data_catalystcenter_external_authentication"]
}

data "catalystcenter_external_authentication" "n004" {
}

output "n004_data_catalystcenter_external_authentication_id" {
  value = data.catalystcenter_external_authentication.n004.id
}
