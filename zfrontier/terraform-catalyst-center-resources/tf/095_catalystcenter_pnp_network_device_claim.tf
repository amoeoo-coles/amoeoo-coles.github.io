# 095 · resource catalystcenter_pnp_network_device_claim · 4. Discovery, inventory and PnP
# This resource claims a Plug and Play device, including StackWise Virtual (SVL) pairs. The claim is a one-time action; changing an attribute submits the claim again. Destroying the resource only removes it from the Terraform state, as Catalyst Center has no operation to un-claim a device.
# Reads models/catalystcenter_pnp_network_device_claim.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/catalystcenter_pnp_network_device_claim.yml"))["catalystcenter_pnp_network_device_claim"]
}

resource "catalystcenter_pnp_network_device_claim" "n095" {
  cabling_scheme             = local.m_095["cabling_scheme"]
  device_id                  = local.m_095["device_id"]
  device_type                = local.m_095["device_type"]
  domain                     = local.m_095["domain"]
  gateway                    = local.m_095["gateway"]
  hostname                   = local.m_095["hostname"]
  image_id                   = local.m_095["image_id"]
  ip_interface_name          = local.m_095["ip_interface_name"]
  remove_inactive            = local.m_095["remove_inactive"]
  rf_profile                 = local.m_095["rf_profile"]
  sensor_profile             = local.m_095["sensor_profile"]
  site_id                    = local.m_095["site_id"]
  static_ip_address          = local.m_095["static_ip_address"]
  subnet_mask                = local.m_095["subnet_mask"]
  svl_members                = local.m_095["svl_members"]
  template_id                = local.m_095["template_id"]
  template_parameters        = local.m_095["template_parameters"]
  top_of_stack_serial_number = local.m_095["top_of_stack_serial_number"]
  vlan_id                    = local.m_095["vlan_id"]
}
