# 102 · data source catalystcenter_project · 6. Templates, profiles and LAN automation
# This data source can read the Project.
# Reads models/data_catalystcenter_project.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/data_catalystcenter_project.yml"))["data_catalystcenter_project"]
}

data "catalystcenter_project" "n102" {
  id = local.m_102["id"]
  name = local.m_102["name"]
}

output "n102_data_catalystcenter_project_id" {
  value = data.catalystcenter_project.n102.id
}
