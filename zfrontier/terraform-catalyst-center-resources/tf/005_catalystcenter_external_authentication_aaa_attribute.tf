# 005 · resource catalystcenter_external_authentication_aaa_attribute · 1. System
# Configure the custom AAA attribute used for external user role mapping in Catalyst Center. When not configured, Catalyst Center uses the protocol default (cisco-av-pair for TACACS or Cisco-AVPair for RADIUS).
# Reads models/catalystcenter_external_authentication_aaa_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/catalystcenter_external_authentication_aaa_attribute.yml"))["catalystcenter_external_authentication_aaa_attribute"]
}

resource "catalystcenter_external_authentication_aaa_attribute" "n005" {
  name = local.m_005["name"]
}
