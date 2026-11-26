# 470 · resource sdwan_security_app_hosting_feature_template · 11. (Classic) feature templates
# This resource can manage a Security App Hosting feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_security_app_hosting_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_470 = yamldecode(file("${path.module}/../models/sdwan_security_app_hosting_feature_template.yml"))["sdwan_security_app_hosting_feature_template"]
}

resource "sdwan_security_app_hosting_feature_template" "n470" {
  description = local.m_470["description"]
  device_types = local.m_470["device_types"]
  name = local.m_470["name"]
  virtual_applications = local.m_470["virtual_applications"]
}
