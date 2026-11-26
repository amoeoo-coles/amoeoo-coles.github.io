# 097 · resource catalystcenter_image_activation · 5. Software image management (SWIM)
# This resource can activate a software image file on the chosen network device (upgrade the software on the device). Every time this resource is created or re-created, the Catalyst Center considers image activation on the device. (Catalyst Center does not however proceed with activation if the imag
# Reads models/catalystcenter_image_activation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/catalystcenter_image_activation.yml"))["catalystcenter_image_activation"]
}

resource "catalystcenter_image_activation" "n097" {
  activate_lower_image_version = local.m_097["activate_lower_image_version"]
  device_upgrade_mode          = local.m_097["device_upgrade_mode"]
  device_uuid                  = local.m_097["device_uuid"]
  distribute_if_needed         = local.m_097["distribute_if_needed"]
  image_uuid_list              = local.m_097["image_uuid_list"]
}
