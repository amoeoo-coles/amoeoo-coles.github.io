# 085 · resource catalystcenter_provision_device · 4. Discovery, inventory and PnP
# This resource can manage a Provision Device.
# Reads models/catalystcenter_provision_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_085 = yamldecode(file("${path.module}/../models/catalystcenter_provision_device.yml"))["catalystcenter_provision_device"]
}

resource "catalystcenter_provision_device" "n085" {
  clean_up_config   = local.m_085["clean_up_config"]
  network_device_id = local.m_085["network_device_id"]
  reprovision       = local.m_085["reprovision"]
  site_id           = local.m_085["site_id"]
}
