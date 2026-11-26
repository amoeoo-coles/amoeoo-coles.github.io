# 018 · resource sdwan_policy_object_app_probe_class · 3. Policy objects and custom applications
# This resource can manage a Policy Object App Probe Class Policy_object. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_app_probe_class.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_018 = yamldecode(file("${path.module}/../models/sdwan_policy_object_app_probe_class.yml"))["sdwan_policy_object_app_probe_class"]
}

resource "sdwan_policy_object_app_probe_class" "n018" {
  description        = local.m_018["description"]
  entries            = local.m_018["entries"]
  feature_profile_id = local.m_018["feature_profile_id"]
  name               = local.m_018["name"]
}
