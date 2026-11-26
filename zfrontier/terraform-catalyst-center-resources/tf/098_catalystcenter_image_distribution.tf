# 098 · resource catalystcenter_image_distribution · 5. Software image management (SWIM)
# This resource can distribute (copy) a software image file to the chosen network device. Every time this resource is created or re-created, the Catalyst Center considers distributying/copying the image onto the device. (Catalyst Center does not however proceed with copying if the image is already p
# Reads models/catalystcenter_image_distribution.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/catalystcenter_image_distribution.yml"))["catalystcenter_image_distribution"]
}

resource "catalystcenter_image_distribution" "n098" {
  device_uuid = local.m_098["device_uuid"]
  image_uuid  = local.m_098["image_uuid"]
}
