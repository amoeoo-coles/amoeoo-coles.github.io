# 194 · data source catalystcenter_application_set · 9. Application policy
# This data source can read the Application Set.
# Reads models/data_catalystcenter_application_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_194 = yamldecode(file("${path.module}/../models/data_catalystcenter_application_set.yml"))["data_catalystcenter_application_set"]
}

data "catalystcenter_application_set" "n194" {
  id   = local.m_194["id"]
  name = local.m_194["name"]
}

output "n194_data_catalystcenter_application_set_id" {
  value = data.catalystcenter_application_set.n194.id
}
