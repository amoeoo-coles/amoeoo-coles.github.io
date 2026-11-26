# 490 · resource sdwan_attach_feature_device_template · 12. (Classic) device templates
# This resource can attach a feature device template. Due to limitations of the API, once a device template is attached to a device, only one change can be applied per terraform apply operation. More information is available here https://registry.terraform.io/providers/CiscoDevNet/sdwan/latest/docs/
# Reads models/sdwan_attach_feature_device_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_490 = yamldecode(file("${path.module}/../models/sdwan_attach_feature_device_template.yml"))["sdwan_attach_feature_device_template"]
}

resource "sdwan_attach_feature_device_template" "n490" {
  devices = local.m_490["devices"]
  id      = local.m_490["id"]
  version = local.m_490["version"]
}
