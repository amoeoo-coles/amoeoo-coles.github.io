# 033 · resource catalystcenter_banner_settings · 3. Network settings and tags
# This resource can manage a Banner Settings.
# Reads models/catalystcenter_banner_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/catalystcenter_banner_settings.yml"))["catalystcenter_banner_settings"]
}

resource "catalystcenter_banner_settings" "n033" {
  message = local.m_033["message"]
  site_id = local.m_033["site_id"]
  type = local.m_033["type"]
}
