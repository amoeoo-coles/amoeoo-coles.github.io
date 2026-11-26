# 422 · resource sdwan_cisco_banner_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco Banner feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_banner_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_422 = yamldecode(file("${path.module}/../models/sdwan_cisco_banner_feature_template.yml"))["sdwan_cisco_banner_feature_template"]
}

resource "sdwan_cisco_banner_feature_template" "n422" {
  description = local.m_422["description"]
  device_types = local.m_422["device_types"]
  login = local.m_422["login"]
  login_variable = local.m_422["login_variable"]
  motd = local.m_422["motd"]
  motd_variable = local.m_422["motd_variable"]
  name = local.m_422["name"]
}
