# 060 · resource catalystcenter_ntp_settings · 3. Network settings and tags
# This resource can manage a NTP Settings.
# Reads models/catalystcenter_ntp_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_060 = yamldecode(file("${path.module}/../models/catalystcenter_ntp_settings.yml"))["catalystcenter_ntp_settings"]
}

resource "catalystcenter_ntp_settings" "n060" {
  servers = local.m_060["servers"]
  site_id = local.m_060["site_id"]
}
