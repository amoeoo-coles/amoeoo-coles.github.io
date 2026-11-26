# 135 · resource sdwan_system_ca_certificate_feature · 5. Features: system
# This resource can manage a System CA Certificate Feature. Minimum SD-WAN Manager version: 20.13.0
# Reads models/sdwan_system_ca_certificate_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_135 = yamldecode(file("${path.module}/../models/sdwan_system_ca_certificate_feature.yml"))["sdwan_system_ca_certificate_feature"]
}

resource "sdwan_system_ca_certificate_feature" "n135" {
  certificates       = local.m_135["certificates"]
  description        = local.m_135["description"]
  feature_profile_id = local.m_135["feature_profile_id"]
  name               = local.m_135["name"]
}
