# 024 · resource mso_schema_site_vrf_region · 4. VRF
# Manages MSO Schema Site Vrf Region.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_vrf_region.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/mso_schema_site_vrf_region.yml"))["mso_schema_site_vrf_region"]
}

resource "mso_schema_site_vrf_region" "n024" {
  hub_network        = local.m_024["hub_network"]
  hub_network_enable = local.m_024["hub_network_enable"]
  region_name        = local.m_024["region_name"]
  schema_id          = local.m_024["schema_id"]
  site_id            = local.m_024["site_id"]
  template_name      = local.m_024["template_name"]
  vpn_gateway        = local.m_024["vpn_gateway"]
  vrf_name           = local.m_024["vrf_name"]
  dynamic "cidr" {
    for_each = local.m_024["cidr"] == null ? [] : local.m_024["cidr"]
    content {
      cidr_ip = lookup(cidr.value, "cidr_ip", null)
      primary = lookup(cidr.value, "primary", null)
      dynamic "subnet" {
        for_each = lookup(cidr.value, "subnet", null) == null ? [] : cidr.value["subnet"]
        content {
          ip           = lookup(subnet.value, "ip", null)
          name         = lookup(subnet.value, "name", null)
          subnet_group = lookup(subnet.value, "subnet_group", null)
          usage        = lookup(subnet.value, "usage", null)
          zone         = lookup(subnet.value, "zone", null)
        }
      }
    }
  }
}
