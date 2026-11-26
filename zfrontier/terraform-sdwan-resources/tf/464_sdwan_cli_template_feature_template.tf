# 464 · resource sdwan_cli_template_feature_template · 11. (Classic) feature templates
# This resource can manage a CLI Template feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cli_template_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_464 = yamldecode(file("${path.module}/../models/sdwan_cli_template_feature_template.yml"))["sdwan_cli_template_feature_template"]
}

resource "sdwan_cli_template_feature_template" "n464" {
  cli_config   = local.m_464["cli_config"]
  description  = local.m_464["description"]
  device_types = local.m_464["device_types"]
  name         = local.m_464["name"]
}
