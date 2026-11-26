# 069 · resource catalystcenter_assign_devices_to_tag · 3. Network settings and tags
# This resource is responsible for assigning devices to a specified tag during creation and removing the device from the tag during destroy operation.
# Reads models/catalystcenter_assign_devices_to_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/catalystcenter_assign_devices_to_tag.yml"))["catalystcenter_assign_devices_to_tag"]
}

resource "catalystcenter_assign_devices_to_tag" "n069" {
  device_ids = local.m_069["device_ids"]
  tag_id = local.m_069["tag_id"]
}
