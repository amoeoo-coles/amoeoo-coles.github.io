# 103 · resource sdwan_application_priority_feature_profile · 4. Feature profiles
# This resource can manage a Application Priority Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_application_priority_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/sdwan_application_priority_feature_profile.yml"))["sdwan_application_priority_feature_profile"]
}

resource "sdwan_application_priority_feature_profile" "n103" {
  description = local.m_103["description"]
  name = local.m_103["name"]
}
