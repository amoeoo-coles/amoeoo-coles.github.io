# 179 · resource catalystcenter_wireless_profile · 8. Wireless
# This resource creates a wireless network profile. To associate a wireless network profile with a site, use the catalystcenter_network_profile_for_sites_assignments resource.
# Reads models/catalystcenter_wireless_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_179 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_profile.yml"))["catalystcenter_wireless_profile"]
}

resource "catalystcenter_wireless_profile" "n179" {
  additional_interfaces = local.m_179["additional_interfaces"]
  ap_zones              = local.m_179["ap_zones"]
  feature_templates     = local.m_179["feature_templates"]
  ssid_details          = local.m_179["ssid_details"]
  wireless_profile_name = local.m_179["wireless_profile_name"]
}
