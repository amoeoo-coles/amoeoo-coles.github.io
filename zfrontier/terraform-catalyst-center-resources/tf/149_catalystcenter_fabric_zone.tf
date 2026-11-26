# 149 · resource catalystcenter_fabric_zone · 7. SD-Access
# This resource can manage a Fabric Zone.
# Reads models/catalystcenter_fabric_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_149 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_zone.yml"))["catalystcenter_fabric_zone"]
}

resource "catalystcenter_fabric_zone" "n149" {
  authentication_profile_name = local.m_149["authentication_profile_name"]
  site_id                     = local.m_149["site_id"]
}
