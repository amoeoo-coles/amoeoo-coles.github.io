# 101 · resource catalystcenter_project · 6. Templates, profiles and LAN automation
# This resource can manage a Project.
# Reads models/catalystcenter_project.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/catalystcenter_project.yml"))["catalystcenter_project"]
}

resource "catalystcenter_project" "n101" {
  description = local.m_101["description"]
  name = local.m_101["name"]
}
