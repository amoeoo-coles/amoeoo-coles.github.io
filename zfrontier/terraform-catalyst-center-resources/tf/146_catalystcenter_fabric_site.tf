# 146 · resource catalystcenter_fabric_site · 7. SD-Access
# Manages Fabric Sites
# Reads models/catalystcenter_fabric_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_146 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_site.yml"))["catalystcenter_fabric_site"]
}

resource "catalystcenter_fabric_site" "n146" {
  authentication_profile_name = local.m_146["authentication_profile_name"]
  pub_sub_enabled = local.m_146["pub_sub_enabled"]
  site_id = local.m_146["site_id"]
}
