# 099 · data source catalystcenter_images · 5. Software image management (SWIM)
# This data source fetches all software images uploaded to the Catalyst Center. Use it to look up an image's id by name — useful as input to catalystcenter_image_distribution or catalystcenter_image_activation when the image was uploaded out-of-band (not via the catalystcenter_image resource).
# Reads models/data_catalystcenter_images.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/data_catalystcenter_images.yml"))["data_catalystcenter_images"]
}

data "catalystcenter_images" "n099" {
}
