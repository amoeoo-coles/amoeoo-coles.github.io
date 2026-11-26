# 087 · resource catalystcenter_provision_devices · 4. Discovery, inventory and PnP
# Manages the provisioning of devices within a single resource, specifying a list of devices to be provisioned in selected site.
# Reads models/catalystcenter_provision_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_087 = yamldecode(file("${path.module}/../models/catalystcenter_provision_devices.yml"))["catalystcenter_provision_devices"]
}

resource "catalystcenter_provision_devices" "n087" {
  provision_devices = local.m_087["provision_devices"]
  site_id = local.m_087["site_id"]
}
