# 493 · resource sdwan_feature_device_template · 12. (Classic) device templates
# This resource can manage a Feature Device Template .
# Reads models/sdwan_feature_device_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_493 = yamldecode(file("${path.module}/../models/sdwan_feature_device_template.yml"))["sdwan_feature_device_template"]
}

resource "sdwan_feature_device_template" "n493" {
  description             = local.m_493["description"]
  device_role             = local.m_493["device_role"]
  device_type             = local.m_493["device_type"]
  general_templates       = local.m_493["general_templates"]
  name                    = local.m_493["name"]
  policy_id               = local.m_493["policy_id"]
  policy_version          = local.m_493["policy_version"]
  security_policy_id      = local.m_493["security_policy_id"]
  security_policy_version = local.m_493["security_policy_version"]
}
