# 096 · resource catalystcenter_image · 5. Software image management (SWIM)
# This resource can fetch a software image from a local file and upload it on the Catalyst Center. It can be further used by catalystcenter_image_distribution, catalystcenter_image_activation, etc.
# Reads models/catalystcenter_image.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/catalystcenter_image.yml"))["catalystcenter_image"]
}

resource "catalystcenter_image" "n096" {
  family = local.m_096["family"]
  is_third_party = local.m_096["is_third_party"]
  name = local.m_096["name"]
  source_path = local.m_096["source_path"]
  third_party_application_type = local.m_096["third_party_application_type"]
  third_party_vendor = local.m_096["third_party_vendor"]
}
