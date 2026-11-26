# 047 · resource catalystcenter_dhcp_settings · 3. Network settings and tags
# This resource can manage a DHCP Settings.
# Reads models/catalystcenter_dhcp_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_047 = yamldecode(file("${path.module}/../models/catalystcenter_dhcp_settings.yml"))["catalystcenter_dhcp_settings"]
}

resource "catalystcenter_dhcp_settings" "n047" {
  servers = local.m_047["servers"]
  site_id = local.m_047["site_id"]
}
