# 106 · data source catalystcenter_template_versions · 6. Templates, profiles and LAN automation
# This data source retrieves all versions of a specific template from the Catalyst Center
# Reads models/data_catalystcenter_template_versions.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/data_catalystcenter_template_versions.yml"))["data_catalystcenter_template_versions"]
}

data "catalystcenter_template_versions" "n106" {
  template_id = local.m_106["template_id"]
}
