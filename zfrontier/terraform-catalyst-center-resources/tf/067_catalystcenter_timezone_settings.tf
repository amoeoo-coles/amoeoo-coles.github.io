# 067 · resource catalystcenter_timezone_settings · 3. Network settings and tags
# This resource can manage a TimeZone Settings.
# Reads models/catalystcenter_timezone_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_067 = yamldecode(file("${path.module}/../models/catalystcenter_timezone_settings.yml"))["catalystcenter_timezone_settings"]
}

resource "catalystcenter_timezone_settings" "n067" {
  identifier = local.m_067["identifier"]
  site_id    = local.m_067["site_id"]
}
