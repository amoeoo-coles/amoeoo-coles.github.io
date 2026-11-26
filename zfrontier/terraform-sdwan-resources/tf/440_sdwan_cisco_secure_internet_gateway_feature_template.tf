# 440 · resource sdwan_cisco_secure_internet_gateway_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco Secure Internet Gateway feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_secure_internet_gateway_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_440 = yamldecode(file("${path.module}/../models/sdwan_cisco_secure_internet_gateway_feature_template.yml"))["sdwan_cisco_secure_internet_gateway_feature_template"]
}

resource "sdwan_cisco_secure_internet_gateway_feature_template" "n440" {
  description                = local.m_440["description"]
  device_types               = local.m_440["device_types"]
  interfaces                 = local.m_440["interfaces"]
  name                       = local.m_440["name"]
  services                   = local.m_440["services"]
  tracker_source_ip          = local.m_440["tracker_source_ip"]
  tracker_source_ip_variable = local.m_440["tracker_source_ip_variable"]
  trackers                   = local.m_440["trackers"]
  vpn_id                     = local.m_440["vpn_id"]
}
