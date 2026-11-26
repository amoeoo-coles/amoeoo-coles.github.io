# 165 · resource catalystcenter_assign_managed_ap_locations · 8. Wireless
# This resource is used to assign managed AP locations to a wireless controller. It allows you to specify primary and secondary managed AP locations for the controller.
# Reads models/catalystcenter_assign_managed_ap_locations.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_165 = yamldecode(file("${path.module}/../models/catalystcenter_assign_managed_ap_locations.yml"))["catalystcenter_assign_managed_ap_locations"]
}

resource "catalystcenter_assign_managed_ap_locations" "n165" {
  device_id                               = local.m_165["device_id"]
  primary_managed_ap_locations_site_ids   = local.m_165["primary_managed_ap_locations_site_ids"]
  secondary_managed_ap_locations_site_ids = local.m_165["secondary_managed_ap_locations_site_ids"]
}
