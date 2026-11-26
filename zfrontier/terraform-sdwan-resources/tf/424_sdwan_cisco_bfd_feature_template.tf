# 424 · resource sdwan_cisco_bfd_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco BFD feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_bfd_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_424 = yamldecode(file("${path.module}/../models/sdwan_cisco_bfd_feature_template.yml"))["sdwan_cisco_bfd_feature_template"]
}

resource "sdwan_cisco_bfd_feature_template" "n424" {
  colors = local.m_424["colors"]
  default_dscp = local.m_424["default_dscp"]
  default_dscp_variable = local.m_424["default_dscp_variable"]
  description = local.m_424["description"]
  device_types = local.m_424["device_types"]
  multiplier = local.m_424["multiplier"]
  multiplier_variable = local.m_424["multiplier_variable"]
  name = local.m_424["name"]
  poll_interval = local.m_424["poll_interval"]
  poll_interval_variable = local.m_424["poll_interval_variable"]
}
