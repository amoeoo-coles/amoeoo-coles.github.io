# 115 · resource sdwan_service_feature_profile · 4. Feature profiles
# This resource can manage a Service Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/sdwan_service_feature_profile.yml"))["sdwan_service_feature_profile"]
}

resource "sdwan_service_feature_profile" "n115" {
  description = local.m_115["description"]
  name        = local.m_115["name"]
}
