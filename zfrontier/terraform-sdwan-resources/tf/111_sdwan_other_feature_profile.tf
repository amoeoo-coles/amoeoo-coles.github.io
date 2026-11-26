# 111 · resource sdwan_other_feature_profile · 4. Feature profiles
# This resource can manage a Other Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_other_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/sdwan_other_feature_profile.yml"))["sdwan_other_feature_profile"]
}

resource "sdwan_other_feature_profile" "n111" {
  description = local.m_111["description"]
  name        = local.m_111["name"]
}
