# 073 · resource catalystcenter_tag · 3. Network settings and tags
# This resource can manage a Tag.
# Reads models/catalystcenter_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/catalystcenter_tag.yml"))["catalystcenter_tag"]
}

resource "catalystcenter_tag" "n073" {
  description   = local.m_073["description"]
  dynamic_rules = local.m_073["dynamic_rules"]
  name          = local.m_073["name"]
  system_tag    = local.m_073["system_tag"]
}
