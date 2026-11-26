# 105 · resource catalystcenter_template_version · 6. Templates, profiles and LAN automation
# This resource can manage a Template Version.
# Reads models/catalystcenter_template_version.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/catalystcenter_template_version.yml"))["catalystcenter_template_version"]
}

resource "catalystcenter_template_version" "n105" {
  comments    = local.m_105["comments"]
  template_id = local.m_105["template_id"]
}
