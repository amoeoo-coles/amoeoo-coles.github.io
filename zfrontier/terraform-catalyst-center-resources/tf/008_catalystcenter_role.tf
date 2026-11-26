# 008 · resource catalystcenter_role · 1. System
# This resource can manage a Role.
# Reads models/catalystcenter_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/catalystcenter_role.yml"))["catalystcenter_role"]
}

resource "catalystcenter_role" "n008" {
  description    = local.m_008["description"]
  name           = local.m_008["name"]
  resource_types = local.m_008["resource_types"]
}
