# 123 · resource catalystcenter_fabric_ewlc · 7. SD-Access
# This resource is used to enable or disable fabric embedded wireless capabilities on switch devices, along with configuring rolling AP upgrades on the fabric site. Reboot action is required to remove wireless configurations.
# Reads models/catalystcenter_fabric_ewlc.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_123 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_ewlc.yml"))["catalystcenter_fabric_ewlc"]
}

resource "catalystcenter_fabric_ewlc" "n123" {
  ap_reboot_percentage      = local.m_123["ap_reboot_percentage"]
  enable_rolling_ap_upgrade = local.m_123["enable_rolling_ap_upgrade"]
  enable_wireless           = local.m_123["enable_wireless"]
  fabric_id                 = local.m_123["fabric_id"]
  network_device_id         = local.m_123["network_device_id"]
}
