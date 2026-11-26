# 491 · resource sdwan_cli_device_template · 12. (Classic) device templates
# This resource can manage a CLI Device Template .
# Reads models/sdwan_cli_device_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_491 = yamldecode(file("${path.module}/../models/sdwan_cli_device_template.yml"))["sdwan_cli_device_template"]
}

resource "sdwan_cli_device_template" "n491" {
  cli_configuration = local.m_491["cli_configuration"]
  cli_type          = local.m_491["cli_type"]
  description       = local.m_491["description"]
  device_type       = local.m_491["device_type"]
  name              = local.m_491["name"]
}
