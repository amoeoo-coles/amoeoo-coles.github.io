# 113 · resource sdwan_policy_object_feature_profile · 4. Feature profiles
# SD-WAN manager supports only a single policy object feature profile to be configured. This resource will therefore either create a new one if none exists or update the existing one. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_policy_object_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/sdwan_policy_object_feature_profile.yml"))["sdwan_policy_object_feature_profile"]
}

resource "sdwan_policy_object_feature_profile" "n113" {
  description = local.m_113["description"]
  name = local.m_113["name"]
}
