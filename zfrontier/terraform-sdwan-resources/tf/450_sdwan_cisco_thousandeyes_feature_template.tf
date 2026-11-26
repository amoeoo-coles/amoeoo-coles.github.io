# 450 · resource sdwan_cisco_thousandeyes_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco ThousandEyes feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_thousandeyes_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_450 = yamldecode(file("${path.module}/../models/sdwan_cisco_thousandeyes_feature_template.yml"))["sdwan_cisco_thousandeyes_feature_template"]
}

resource "sdwan_cisco_thousandeyes_feature_template" "n450" {
  description          = local.m_450["description"]
  device_types         = local.m_450["device_types"]
  name                 = local.m_450["name"]
  virtual_applications = local.m_450["virtual_applications"]
}
