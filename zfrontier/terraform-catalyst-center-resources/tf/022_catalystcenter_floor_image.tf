# 022 · resource catalystcenter_floor_image · 2. Sites
# This resource uploads a floor plan image (PNG, JPEG, PDF) to an existing floor in Catalyst Center. The image is used for map visualization and RF planning. Every time this resource is created or re-created, the image is uploaded. When destroyed, no action is taken (Catalyst Center does not support
# Reads models/catalystcenter_floor_image.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_022 = yamldecode(file("${path.module}/../models/catalystcenter_floor_image.yml"))["catalystcenter_floor_image"]
}

resource "catalystcenter_floor_image" "n022" {
  floor_id = local.m_022["floor_id"]
  source_path = local.m_022["source_path"]
}
