# 062 · resource catalystcenter_sp_profile · 3. Network settings and tags
# This resource can manage a SP Profile.
# Reads models/catalystcenter_sp_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_062 = yamldecode(file("${path.module}/../models/catalystcenter_sp_profile.yml"))["catalystcenter_sp_profile"]
}

resource "catalystcenter_sp_profile" "n062" {
  model        = local.m_062["model"]
  name         = local.m_062["name"]
  wan_provider = local.m_062["wan_provider"]
}
