# 348 · resource sdwan_app_probe_class_policy_object · 10. (Classic) policy objects
# This resource can manage a App Probe Class Policy Object .
# Reads models/sdwan_app_probe_class_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_348 = yamldecode(file("${path.module}/../models/sdwan_app_probe_class_policy_object.yml"))["sdwan_app_probe_class_policy_object"]
}

resource "sdwan_app_probe_class_policy_object" "n348" {
  forwarding_class = local.m_348["forwarding_class"]
  mappings         = local.m_348["mappings"]
  name             = local.m_348["name"]
}
