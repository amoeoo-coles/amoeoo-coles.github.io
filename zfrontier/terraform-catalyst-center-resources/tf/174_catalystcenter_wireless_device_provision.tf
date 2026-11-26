# 174 · resource catalystcenter_wireless_device_provision · 8. Wireless
# This resource is used to provision a wireless device. To reprovision a device, set the reprovision attribute to true. The resource will then trigger reprovisioning on every Terraform apply.
# Reads models/catalystcenter_wireless_device_provision.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_174 = yamldecode(file("${path.module}/../models/catalystcenter_wireless_device_provision.yml"))["catalystcenter_wireless_device_provision"]
}

resource "catalystcenter_wireless_device_provision" "n174" {
  ap_authorization_list_name = local.m_174["ap_authorization_list_name"]
  ap_reboot_percentage = local.m_174["ap_reboot_percentage"]
  authorize_mesh_and_non_mesh_access_points = local.m_174["authorize_mesh_and_non_mesh_access_points"]
  enable_rolling_ap_upgrade = local.m_174["enable_rolling_ap_upgrade"]
  interfaces = local.m_174["interfaces"]
  network_device_id = local.m_174["network_device_id"]
  reprovision = local.m_174["reprovision"]
  skip_ap_provision = local.m_174["skip_ap_provision"]
}
