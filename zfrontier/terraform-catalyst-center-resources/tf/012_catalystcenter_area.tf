# 012 · resource catalystcenter_area · 2. Sites
# This resource can manage an Area.
# Reads models/catalystcenter_area.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/catalystcenter_area.yml"))["catalystcenter_area"]
}

resource "catalystcenter_area" "n012" {
  name      = local.m_012["name"]
  parent_id = local.m_012["parent_id"]
}
