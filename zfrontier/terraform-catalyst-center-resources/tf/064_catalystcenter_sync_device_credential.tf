# 064 · resource catalystcenter_sync_device_credential · 3. Network settings and tags
# This resource applies (syncs) a device credential that is already assigned to a site to the site's network devices. It is the equivalent of the Apply action in Design > Network Settings > Credentials > Manage Credentials. The credential must already be assigned to the site (see catalystcenter_assi
# Reads models/catalystcenter_sync_device_credential.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_064 = yamldecode(file("${path.module}/../models/catalystcenter_sync_device_credential.yml"))["catalystcenter_sync_device_credential"]
}

resource "catalystcenter_sync_device_credential" "n064" {
  configure_device = local.m_064["configure_device"]
  device_credential_id = local.m_064["device_credential_id"]
  site_id = local.m_064["site_id"]
}
