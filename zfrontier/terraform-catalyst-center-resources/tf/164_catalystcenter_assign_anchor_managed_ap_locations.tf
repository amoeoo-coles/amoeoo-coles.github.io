# 164 · resource catalystcenter_assign_anchor_managed_ap_locations · 8. Wireless
# This resource is used to assign anchor managed AP locations to a wireless controller (WLC) acting as a Foreign Anchor. The payload should always be a complete list of site IDs; locations included in the payload will be fully processed for both addition and deletion.
# Reads models/catalystcenter_assign_anchor_managed_ap_locations.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_164 = yamldecode(file("${path.module}/../models/catalystcenter_assign_anchor_managed_ap_locations.yml"))["catalystcenter_assign_anchor_managed_ap_locations"]
}

resource "catalystcenter_assign_anchor_managed_ap_locations" "n164" {
  anchor_managed_ap_locations_site_ids = local.m_164["anchor_managed_ap_locations_site_ids"]
  device_id                            = local.m_164["device_id"]
}
