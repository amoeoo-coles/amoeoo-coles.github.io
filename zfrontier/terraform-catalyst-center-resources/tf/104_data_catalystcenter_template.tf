# 104 · data source catalystcenter_template · 6. Templates, profiles and LAN automation
# This data source can read the Template.
# Reads models/data_catalystcenter_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/data_catalystcenter_template.yml"))["data_catalystcenter_template"]
}

data "catalystcenter_template" "n104" {
  id         = local.m_104["id"]
  name       = local.m_104["name"]
  project_id = local.m_104["project_id"]
}

output "n104_data_catalystcenter_template_id" {
  value = data.catalystcenter_template.n104.id
}
