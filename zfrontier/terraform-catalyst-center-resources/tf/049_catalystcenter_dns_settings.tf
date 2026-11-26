# 049 · resource catalystcenter_dns_settings · 3. Network settings and tags
# This resource can manage a DNS Settings.
# Reads models/catalystcenter_dns_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_049 = yamldecode(file("${path.module}/../models/catalystcenter_dns_settings.yml"))["catalystcenter_dns_settings"]
}

resource "catalystcenter_dns_settings" "n049" {
  dns_servers = local.m_049["dns_servers"]
  domain_name = local.m_049["domain_name"]
  site_id     = local.m_049["site_id"]
}
