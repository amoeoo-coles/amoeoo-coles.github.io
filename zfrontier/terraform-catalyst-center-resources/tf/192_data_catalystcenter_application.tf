# 192 · data source catalystcenter_application · 9. Application policy
# This data source can read the Application.
# Reads models/data_catalystcenter_application.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_192 = yamldecode(file("${path.module}/../models/data_catalystcenter_application.yml"))["data_catalystcenter_application"]
}

data "catalystcenter_application" "n192" {
  name = local.m_192["name"]
}

output "n192_data_catalystcenter_application_id" {
  value = data.catalystcenter_application.n192.id
}
