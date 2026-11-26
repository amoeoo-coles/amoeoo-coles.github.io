# 093 · resource catalystcenter_pnp_device_claim_site · 4. Discovery, inventory and PnP
# This resource can manage a PnP Device Claim Site.
# Reads models/catalystcenter_pnp_device_claim_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/catalystcenter_pnp_device_claim_site.yml"))["catalystcenter_pnp_device_claim_site"]
}

resource "catalystcenter_pnp_device_claim_site" "n093" {
  cabling_scheme = local.m_093["cabling_scheme"]
  config_id = local.m_093["config_id"]
  config_parameters = local.m_093["config_parameters"]
  device_id = local.m_093["device_id"]
  gateway = local.m_093["gateway"]
  hostname = local.m_093["hostname"]
  image_id = local.m_093["image_id"]
  image_skip = local.m_093["image_skip"]
  ip_interface_name = local.m_093["ip_interface_name"]
  rf_profile = local.m_093["rf_profile"]
  sensor_profile = local.m_093["sensor_profile"]
  site_id = local.m_093["site_id"]
  static_ip = local.m_093["static_ip"]
  subnet_mask = local.m_093["subnet_mask"]
  top_of_stack_serial_number = local.m_093["top_of_stack_serial_number"]
  type = local.m_093["type"]
  vlan_id = local.m_093["vlan_id"]
}
