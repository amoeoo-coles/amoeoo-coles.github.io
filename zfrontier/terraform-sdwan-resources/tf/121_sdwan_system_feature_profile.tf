# 121 · resource sdwan_system_feature_profile · 4. Feature profiles
# This resource can manage a System Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_121 = yamldecode(file("${path.module}/../models/sdwan_system_feature_profile.yml"))["sdwan_system_feature_profile"]
}

resource "sdwan_system_feature_profile" "n121" {
  description = local.m_121["description"]
  name = local.m_121["name"]
}
