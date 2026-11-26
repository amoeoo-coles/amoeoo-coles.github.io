# 084 · resource catalystcenter_provision_access_points · 4. Discovery, inventory and PnP
# Manages the provisioning of Access Points within a single resource, specifying a list of access points to be provisioned in selected site.
# Reads models/catalystcenter_provision_access_points.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_084 = yamldecode(file("${path.module}/../models/catalystcenter_provision_access_points.yml"))["catalystcenter_provision_access_points"]
}

resource "catalystcenter_provision_access_points" "n084" {
  ap_zone_name = local.m_084["ap_zone_name"]
  network_devices = local.m_084["network_devices"]
  rf_profile_name = local.m_084["rf_profile_name"]
  site_id = local.m_084["site_id"]
}
