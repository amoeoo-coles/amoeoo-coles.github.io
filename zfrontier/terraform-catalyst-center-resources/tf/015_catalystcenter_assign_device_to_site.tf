# 015 · resource catalystcenter_assign_device_to_site · 2. Sites
# Assign unprovisioned network devices to a site.
# Reads models/catalystcenter_assign_device_to_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_015 = yamldecode(file("${path.module}/../models/catalystcenter_assign_device_to_site.yml"))["catalystcenter_assign_device_to_site"]
}

resource "catalystcenter_assign_device_to_site" "n015" {
  device_ids = local.m_015["device_ids"]
  site_id = local.m_015["site_id"]
}
