# 119 · resource sdwan_sse_feature_profile · 4. Feature profiles
# This resource can manage a SSE Feature Profile . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_sse_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_119 = yamldecode(file("${path.module}/../models/sdwan_sse_feature_profile.yml"))["sdwan_sse_feature_profile"]
}

resource "sdwan_sse_feature_profile" "n119" {
  description = local.m_119["description"]
  name        = local.m_119["name"]
}
